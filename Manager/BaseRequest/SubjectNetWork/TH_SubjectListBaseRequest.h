//
//  TH_SubjectListBaseRequest.h
//  GangtaiLife
//
//  Created by Alpha on 2017/7/11.
//  Copyright © 2017年 mingyue1026. All rights reserved.
//

#import "TH_BaseRequest.h"

@interface TH_SubjectListBaseRequest : TH_BaseRequest

/**
 专题列表
 
 @param pageNo pageNo
 @param pageSize pageSize
 @param title title
 @return <#return value description#>
 */
- (instancetype)initWithPageNo:(NSInteger  )pageNo pageSize:(NSString *)pageSize title:(NSString *)title;

@end
