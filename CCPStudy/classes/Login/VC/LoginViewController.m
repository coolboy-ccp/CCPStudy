//
//  LoginViewController.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "LoginViewController.h"
#import "NetView.h"
#import "LoginVM.h"
#import "MainViewController.h"
#import "ExplainView.h"
#import "MasonryViewController.h"
#import "BaseTabbarVCViewController.h"

@interface LoginViewController ()
    
@property (weak, nonatomic) IBOutlet NetView *netV;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *accountTextField;
@property (weak, nonatomic) IBOutlet UITextField *secretTextField;
@property (assign,nonatomic) CGFloat width;
@property (nonatomic,strong) LoginVM *vm;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLBtn];
    ExplainView *explain = [[ExplainView alloc] initWithFrame:CGRectMake(46, 284, Main_width - 92, 200)];
    self.vm = [[LoginVM alloc] init];
    [self.view addSubview:explain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.loginBtn.layer.mask.bounds = CGRectMake(0, 0, Main_width - 92 , 34);
}

- (void)setLBtn {
    RAC(self.loginBtn,enabled) = [RACSignal combineLatest:@[self.accountTextField.rac_textSignal,self.secretTextField.rac_textSignal] reduce:^id{
        if (([self judgeAccount])) {
            self.loginBtn.alpha = 1.0;
        }
        else {
            self.loginBtn.alpha = 0.6;
        }
        return @([self judgeAccount]);
    }];
    [self btnLayer];
}


- (BOOL)judgeAccount {
    NSString *ac = self.accountTextField.text;
    return ([ac isEqualToString:@"a1"] || [ac isEqualToString:@"a2"] || [ac isEqualToString:@"a3"] || [ac isEqualToString:@"a4"]) && [self.secretTextField.text isEqualToString:@"aaa"];
}
- (void)btnLayer {
    self.loginBtn.layer.mask = nil;
    CALayer *mLayer = [CALayer layer];
    mLayer.bounds = CGRectMake(0, 0, Main_width - 92 , 34);
    mLayer.cornerRadius = 10;
    mLayer.backgroundColor = [UIColor redColor].CGColor;
    mLayer.position = CGPointMake((Main_width - 92) / 2, 0);
    mLayer.anchorPoint = CGPointMake(0.5, 0);
    [self.loginBtn.layer setMask:mLayer];
}
    
- (IBAction)LoginBtn:(UIButton *)sender {
    [self.view endEditing:YES];
    sender.layer.mask.bounds = CGRectMake(0, 0, 100, 34);
    NSString *ac = self.accountTextField.text;
    [RACObserve(self.vm, loginStatus) subscribeNext:^(NSString *x) {
        if ([x isEqualToString:@"seccessfull"]) {
            if ([self isKindOfClass:[LoginViewController class]]) {
                if ([ac isEqualToString:@"a1"]) {
                    MainViewController *main = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"mainStory"];
                    [self.navigationController pushViewController:main animated:YES];
                }
                else if ([ac isEqualToString:@"a2"]) {
                    MasonryViewController *masonry = [[MasonryViewController alloc] init];
                    [self.navigationController pushViewController:masonry animated:YES];
                }
                else if ([ac isEqualToString:@"a3"]) {
                    BaseTabbarVCViewController *tab = [[BaseTabbarVCViewController alloc] init];
                    [self.navigationController pushViewController:tab animated:YES];
                }
            }
            
        }
    }];
    [self.vm changeStatusWithView:self];
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
