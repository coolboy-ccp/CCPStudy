//
//  BaseViewController.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)createNavWithTitle:(NSString *)title andBackColor:(UIColor *)color {
    UIView *nav = [[UIView alloc] init];
    nav.backgroundColor = color;
    [self.view addSubview:nav];
    WS(ws);
    [nav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.view);
        make.top.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(Main_width, 64));
    }];
    UILabel *la = [[UILabel alloc] init];
    la.font = [UIFont systemFontOfSize:20];
    la.textColor = [UIColor whiteColor];
    la.textAlignment = NSTextAlignmentCenter;
    la.text = title;
    [nav addSubview:la];
    [la mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.view);
        make.top.mas_equalTo(25.0);
        make.size.mas_equalTo(CGSizeMake(200, 64 - 29));
    }];
}

@end
