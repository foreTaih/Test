//
//  TH_PageResponse.h
//  GangtaiLife
//
//  Created by Alpha on 2017/7/11.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TH_PageResponse : NSObject

@property (nonatomic, copy,readonly ) NSString *pageNo;
@property (nonatomic, copy,readonly ) NSString *pageSize;
@property (nonatomic, copy,readonly ) NSString *start;
@property (nonatomic, copy,readonly ) NSString *end;

@end
