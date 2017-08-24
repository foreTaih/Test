//
//  TH_BodyBaseRequest.m
//  GangtaiLife
//
//  Created by Alpha on 2017/7/8.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import "TH_BodyBaseRequest.h"

@implementation TH_BodyBaseRequest

-(AFConstructingBlock)constructingBodyBlock
{
    if (!_isBody) {
        return  nil;
    }
    return  ^(id <AFMultipartFormData> formData){
        
        NSInteger rand = arc4random() % INT_MAX;
        NSString *name = [NSString stringWithFormat:@"image_%ld", (long)rand];
        NSString *formKey = @"upLoadFile";
        NSString *type = @"image/jpeg";
        [formData appendPartWithFileData:_requestData name:formKey fileName:name mimeType:type];
    };
}

-(NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary
{
    NSString * sessiionauth = [TH_UserDefaultManager getUserAccessToken];
    return   @{@"TH-SESSIONAUTH":sessiionauth};

}

-(YTKRequestSerializerType)requestSerializerType
{
    return  YTKRequestSerializerTypeHTTP;
}




@end
