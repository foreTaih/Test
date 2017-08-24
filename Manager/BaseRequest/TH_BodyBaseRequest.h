//
//  TH_BodyBaseRequest.h
//  GangtaiLife
//
//  Created by Alpha on 2017/7/8.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import "TH_BaseRequest.h"

@interface TH_BodyBaseRequest : TH_BaseRequest

/**
 当content type 为表单格式的时候 而且请求为body的时候 需要使用此参数
 */
@property (nonatomic, copy) NSData *requestData;

/**
 网络请求是否是使用body   上传数据 例如图片
 */
@property (nonatomic, assign) BOOL  isBody;

@end
