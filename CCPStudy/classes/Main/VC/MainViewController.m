//
//  MainViewController.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/23.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "MainViewController.h"
#import "ClipView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ClipView *cilp = [[ClipView alloc] initWithFrame:MainScreen_bounds];
    [self.view addSubview:cilp];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(15, 29, 30, 30);
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitle:@"<" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.view insertSubview:btn aboveSubview:cilp];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
