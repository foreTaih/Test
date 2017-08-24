//
//  TH_SubjectListBaseRequest.m
//  GangtaiLife
//
//  Created by Alpha on 2017/7/11.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import "TH_SubjectListBaseRequest.h"

@implementation TH_SubjectListBaseRequest
- (instancetype)initWithPageNo:(NSInteger  )pageNo pageSize:(NSString *)pageSize title:(NSString *)title
{
    self = [super init];
    if (self) {
        NSMutableDictionary * params = [[NSMutableDictionary alloc] init];
        [params  setValue:title forKey:@"title"];
        NSMutableDictionary * page = [[NSMutableDictionary alloc] init];
        [page setValue:@(pageNo) forKey:@"pageNo"];
        [page setValue:pageSize forKey:@"pageSize"];
        self.header = @{@"page":page,@"params":params};
    }
    return self;
}

@end
