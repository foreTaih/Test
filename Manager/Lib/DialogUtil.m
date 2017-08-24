//
//  DialogUtil.m
//  etiaolong
//
//  Created by Alpha on 2017/3/10.
//  Copyright © 2017年 etiaolong. All rights reserved.
//

#import "DialogUtil.h"

@implementation DialogUtil
{
    MBProgressHUD *dialog;
}
+ (id)sharedInstance
{
    static  DialogUtil *sharedInstance = nil ;
    static  dispatch_once_t onceToken;  // 锁
    dispatch_once (& onceToken, ^ {     // 最多调用一次
        sharedInstance = [[DialogUtil  alloc] init];
    });
    return  sharedInstance;
}

-(MBProgressHUD *)getDialog{
    [self hideDialog];
    
//    UIView * view = [[UIApplication sharedApplication].windows lastObject];
//    if (view.hidden == YES) {
//        view.hidden = NO;
//    }
//    UIImage * image = [UIImage sd_animatedGIFNamed:@"TH_Loading"];
//    UIImageView * figView = [[UIImageView alloc] initWithImage:image];
//    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    dialog = hud;
//    hud.mode = MBProgressHUDModeCustomView;
//    hud.customView = figView;
//    hud.removeFromSuperViewOnHide = YES;
//    return  hud;
   UIView * view = [[UIApplication sharedApplication].windows lastObject];
    if (view.hidden == YES) {
        view.hidden = NO;
    }
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    dialog = hud;
    hud.label.text = @"加载中...";
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    dialog.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    dialog.backgroundView.color = [UIColor clearColor];
    return hud;
}

-(MBProgressHUD *)downLoadDialogWithProgress:(NSProgress *)progressObject
{
    [self hideDialog];
      UIView * view = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = NSLocalizedString(@"Loading...", @"HUD loading title");
    
    hud.progressObject = progressObject;
    
    [hud.button setTitle:NSLocalizedString(@"Cancel", @"HUD cancel button title") forState:UIControlStateNormal];
    [hud.button addTarget:progressObject action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    
    return hud;
}

-(MBProgressHUD *)getDialog:(UIView *)_view withLabel:(NSString *)_label{
    if (!_view || !_label ) {
        return [self getDialog];
    }
    dialog = [[MBProgressHUD alloc] initWithView:_view];
    dialog.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    dialog.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    dialog.label.text = _label;
    [_view addSubview:dialog];
    return dialog;
}

-(void)hideDialog{
    if (dialog) {
        [dialog hideAnimated:YES];
        dialog = nil;
    }
}

+(void)showToast:(NSString *)_msg{
    
    [DialogUtil showtoast:_msg delay:1.0f];
}
-(void)showLoading : (UIView *)vcView
{
    dialog = [[MBProgressHUD alloc] initWithView:vcView];
    dialog.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    dialog.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    dialog.label.text = @"加载中...";
    [vcView addSubview:dialog];
    [dialog showAnimated:YES];
}


+(void)showtoast:(NSString *)_msg delay:(CGFloat)delay{

    
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.label.text = _msg;
    hud.margin = 8.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:delay];
}

-(void)cancel
{

}


@end
