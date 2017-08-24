//
//  TH_BaseRequest.m
//  GangtaiLife
//
//  Created by Alpha on 2017/6/13.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import "TH_BaseRequest.h"
#import "TH_BaseResponse.h"


@implementation TH_BaseRequest

-(instancetype)init
{
    if (self = [super init]) {
        
        _silent = NO;
        _stopWhenFail = NO;
        _apiVersion = @"v1.0";
        self.header = @{};
        _contentTypeJson = YES;
    }return  self;
}

-(void)requestFailedFilter
{
    [super requestFailedFilter];
    [[DialogUtil sharedInstance] hideDialog];
    DLog(@"请求失败  请求的参数 数据 {status : %ld baseUrl:%@%@,argument:%@,requestHeaderFieldValueDictionary :%@ ，response %@}",(long)[self responseStatusCode] ,[self baseUrl],[self requestUrl],[self requestArgument],[self requestHeaderFieldValueDictionary],[self responseJSONObject]);
    [DialogUtil showToast:@"网络请求失败，请稍后重试"];
    if ([self isStopWhenFail]) {
        [self stop];
    }
}

-(void)requestCompleteFilter
{
    [super requestCompleteFilter];
    TH_BaseResponse *baseResponse = nil;
    [[DialogUtil sharedInstance] hideDialog];
    if ([self isDataFromCache]) {
        baseResponse = [TH_BaseResponse mj_objectWithKeyValues:[self cacheSensitiveData]];
        DLog(@"使用缓存中的数据 : %@", [self cacheSensitiveData]);
    }else{
        baseResponse = [TH_BaseResponse mj_objectWithKeyValues:[self responseJSONObject]];
        DLog(@"请求到的数据 {status : %@ baseUrl+ request url:%@%@ self.header   %@  requestHeaderFieldValueDictionary :%@,response %@}",baseResponse.code ,[self baseUrl],[self requestUrl],[self requestArgument],[self requestHeaderFieldValueDictionary],[self responseJSONObject]);
    }
    if (baseResponse.success) {
        // 网络请求成功
        DLog(@"网络请求操作成功!");
    }else{
        // 失败
        DLog(@"请求操作失败 baseUrl+ request  %@%@失败信息 %@",[self baseUrl],[self requestUrl],baseResponse.msg);
        THLive_RequestErrorCode netWorkCode =(THLive_RequestErrorCode)[baseResponse.code integerValue];
        switch (netWorkCode) {
            case THLive_RequestErrorCode101:
                break;
            case THLive_RequestErrorCode102:{
                
            }break;
            case THLive_RequestErrorCode103:{
                
            }break;
            case THLive_RequestErrorCode104:{
                
            }break;
            case THLive_RequestErrorCode105:{
                
            }break;
            case THLive_RequestErrorCode200:{
                [TH_LoginManager presentLoginPage];
            }break;
            case THLive_RequestErrorCode201:{
                
            }break;
            case THLive_RequestErrorCode202:{
            }break;
            case THLive_RequestErrorCode203:{
                // token失效
                [TH_UserDefaultManager clearUserInfo];
                [TH_LoginManager presentLoginPage];
            }break;
            case THLive_RequestErrorCode3001:{
                
            }break;
            case THLive_RequestErrorCode3002:{
                
            }break;
            default:
                break;
        }
        if (!self.isSlient) {
            [DialogUtil showToast:baseResponse.msg];
        }
        if ([self isStopWhenFail]) {
            [self stop];
        }
        return ;
    }
}

-(YTKRequestMethod)requestMethod
{
    
    return  YTKRequestMethodPOST;
}

-(NSString *)baseUrl
{
    TH_EnvironmentType type = [[TH_EnvironmengConfig shareManager] type];
    switch (type) {
        case HT_EnvironmentTypeProduct:
        case TH_EnvironmentTypeDevelop:{
            return  [TH_EnvironmengConfig baseUrl];
        }
            break;
            
        case TH_EnvironmentTypeLocal:
            if (_localUrl.length) {
                 return  _localUrl;
            }else{
               return  [TH_EnvironmengConfig baseUrl];
            }
        default:
            break;
    }
}
-(YTKRequestSerializerType)requestSerializerType
{
    if (_contentTypeJson) {
        return  YTKRequestSerializerTypeJSON;
    }else{
        return  YTKRequestSerializerTypeHTTP;  // 表单格式需要注意 返回值为0
    }
}
- (NSTimeInterval)requestTimeoutInterval {
    return 30;
}
-(NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary
{
    NSString * sessiionauth = [TH_UserDefaultManager getUserAccessToken];
    if (_contentTypeJson) {
        return @{@"Content-Type":@"application/json",@"TH-SESSIONAUTH":sessiionauth};
    }else{
        return   @{@"Content-Type":@"application/x-www-form-urlencoded",@"TH-SESSIONAUTH":sessiionauth};
    }
}


-(id)requestArgument
{
    return  self.header;
}


@end
