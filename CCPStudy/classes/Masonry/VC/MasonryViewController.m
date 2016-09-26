//
//  MasonryViewController.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/26.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "MasonryViewController.h"

@interface MasonryViewController ()

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    // Do any additional setup after loading the view.
}

- (void)createView {
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = RGBA(220, 220, 230, 1.0);
    [self.view addSubview:view1];//必须在autoLayout之前添加
    WS(ws);
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300,300));
    }];
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = RGBA(240, 220, 220, 1.0);
    [view1 addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.centerX.equalTo(view1);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = RGBA(172, 202, 220, 1.0);
    [btn setTitle:@"Change" forState:UIControlStateNormal];
    [view1 addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view2).with.offset(80);
        make.centerX.equalTo(view1);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        [UIView animateWithDuration:0.8 animations:^{
            [view2 mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(view1).with.offset(20);
                make.size.mas_equalTo(CGSizeMake(100, 100));
            }];
            [view1 layoutIfNeeded];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
