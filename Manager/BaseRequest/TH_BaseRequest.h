//
//  TH_BaseRequest.h
//  GangtaiLife
//
//  Created by Alpha on 2017/6/13.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//


#import <YTKNetwork/YTKNetwork.h>
#import "AFNetworking.h"

typedef enum {
    THLive_RequestErrorCode101 = 101, // 失败
    THLive_RequestErrorCode102 = 102, // 系统繁忙
    THLive_RequestErrorCode103 = 103, // 访问超时
    THLive_RequestErrorCode104 = 104, // 不支持https contentype
    THLive_RequestErrorCode105 = 105, // 网络访问错误
    THLive_RequestErrorCode200 = 200, // 没有登录
    THLive_RequestErrorCode201 = 201, // 访问限制
    THLive_RequestErrorCode202 = 202, // 参数错误
    THLive_RequestErrorCode203 = 203, // 无效的令牌 token 失效
    
    THLive_RequestErrorCode3001 = 3001, // 非法参数
    THLive_RequestErrorCode3002 = 3002, // 系统异常
}THLive_RequestErrorCode;



@interface TH_BaseRequest : YTKRequest

/**
 *  静默标志 请求成功失败都不弹出提示框   默认为no
 */
@property (nonatomic, assign,getter=isSlient) BOOL  silent;


/**
 *  请求失败的时候是否 停止网络请求 默认为no
 */
@property (nonatomic, assign,getter=isStopWhenFail) BOOL  stopWhenFail;


/**
 *  请求头信息
 */
@property (nonatomic, strong) NSDictionary *header;

/**
 *  错误响应信息
 */
@property (nonatomic, strong) NSError *errorResponse;

/**
 *  api的版本
 */
@property (nonatomic, copy) NSString *apiVersion;




/**
content type 类型
 */
@property (nonatomic, assign) BOOL  contentTypeJson;





#pragma mark - 测试环境和本地环境接口
/**
 开发环境的  端口
 */
@property (nonatomic, copy) NSString *port;

/**
 本地的 baseUrl
 */
@property (nonatomic, copy) NSString *localUrl;



@end

/*
 商品服务    50008
 订单服务    50009
 积分服务    50010
 活动专题    50011
 预定服务    50012
 会员中心    50013
 消息服务    50014
 支付服务    50016
 优惠券服务  50015
 */
