//
//  LoginVM.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "LoginVM.h"
#import "MainViewController.h"

@implementation LoginVM
    
-(NSString *)account {
    if (!_account) {
        _account = @"";
    }
    return _account;
}
    
- (NSString *)secret {
    if (!_secret) {
        _secret = @"";
    }
    return _secret;
}

- (void)changeStatusWithView:(UIViewController *)view {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = @"logining";
    hud.progress = 0.0;
    [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        dispatch_async(dispatch_get_main_queue(), ^{
            hud.progress += 0.1;
        });
        if (hud.progress >= 1.0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [hud hideAnimated:YES];
            });
            self.loginStatus = @"seccessfull";
            [timer invalidate];
        }
    }];
}

@end
