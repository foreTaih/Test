//
//  TH_BookBaseRequest.h
//  GangtaiLife
//
//  Created by Alpha on 2017/7/12.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import "TH_BaseRequest.h"

@interface TH_BookBaseRequest : TH_BaseRequest

-(instancetype)initWithPageNo:(NSString *)pageNo pageSize:(NSString *)pageSize params:(NSDictionary *)dict;

@end
