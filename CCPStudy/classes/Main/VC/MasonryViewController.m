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
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
