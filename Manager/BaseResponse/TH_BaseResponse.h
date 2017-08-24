//
//  TH_BaseResponse.h
//  GangtaiLife
//
//  Created by Alpha on 2017/6/13.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TH_BaseResponse : NSObject

@property (nonatomic, copy, readonly) NSString *msg;

@property (nonatomic, copy, readonly) NSString *code;

@property (nonatomic, assign) BOOL success;


@end
