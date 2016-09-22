//
//  LoginViewController.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "LoginViewController.h"
#import "NetView.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet NetView *netV;
    @property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchNet:(UIButton *)sender {
    [GLobalRealReachability startNotifier];
    [GLobalRealReachability reachabilityWithBlock:^(ReachabilityStatus status) {
        [self refreshNetViewWithStatus:status];
    }];
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName: kRealReachabilityChangedNotification object:nil]subscribeNext:^(NSNotification *x) {
        RealReachability *bty = (RealReachability *)x.object;
        ReachabilityStatus status = [bty currentReachabilityStatus];
        [self refreshNetViewWithStatus:status];
    }];
}

- (void)refreshNetViewWithStatus:(ReachabilityStatus)status {
        if (status == RealStatusViaWiFi) {
            self.netV.color = RGBA(100, 220, 220, 1.0);
            [self.netV setNeedsDisplay];
        }
        else {
            self.netV.color = RGBA(220, 220, 220, 1.0);
            [self.netV setNeedsDisplay];
        }
    
}

@end
