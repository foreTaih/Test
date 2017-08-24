//
//  TH_BookBaseRequest.m
//  GangtaiLife
//
//  Created by Alpha on 2017/7/12.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import "TH_BookBaseRequest.h"

@implementation TH_BookBaseRequest

-(instancetype)initWithPageNo:(NSString *)pageNo pageSize:(NSString *)pageSize params:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        NSMutableDictionary * mut = [[NSMutableDictionary alloc] init];
        [mut setValue:pageSize forKey:@"pageSize"];
        [mut setValue:pageNo forKey:@"pageNo"];
        self.header = @{@"page":mut,@"params":dict};
    }return  self;
}
@end
