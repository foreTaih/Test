//
//  TH_LoginBaseRequest.m
//  GangtaiLife
//
//  Created by Alpha on 2017/7/4.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import "TH_LoginBaseRequest.h"

@implementation TH_LoginBaseRequest

-(instancetype)init
{
    if (self = [super init]) {
        self.contentTypeJson = NO;
    }return  self;
}

-(id)requestArgument{
    
    NSMutableDictionary * myHeader = [NSMutableDictionary dictionaryWithDictionary:self.header];
    [myHeader addEntriesFromDictionary:self.header];
    [myHeader setValue:@"ios" forKey:@"source"];
    [myHeader setValue:@"1.0" forKey:@"version"];
    
//    NSDictionary *mutDict = @{@"source":@"ios",
//                              @"version":@"1.0"
//                              };
//    [self.header.mutableCopy addEntriesFromDictionary:mutDict];
    return myHeader.copy;
}


@end
