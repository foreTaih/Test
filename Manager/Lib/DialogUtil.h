//
//  DialogUtil.h
//  etiaolong
//
//  Created by Alpha on 2017/3/10.
//  Copyright © 2017年 etiaolong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface DialogUtil : NSObject


+ (id)sharedInstance;

/**
 显示动态gif 图片
 
 @return <#return value description#>
 */
-(MBProgressHUD *)getDialog;


-(MBProgressHUD *)getDialog:(UIView *)_view withLabel:(NSString *)_label;

-(void)hideDialog;

+(void)showToast:(NSString *)_msg;

+(void)showtoast:(NSString *)_msg delay:(CGFloat)delay;

-(void)showLoading : (UIView *)vcView;

/**
 *  下载 
 *
 *  @param progressObject <#progressObject description#>
 *
 *  @return <#return value description#>
 */
-(MBProgressHUD *)downLoadDialogWithProgress:(NSProgress *)progressObject;


@end
