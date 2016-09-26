//
//  TabNavViewController.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/26.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "TabNavViewController.h"

@interface TabNavViewController ()

@end

@implementation TabNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden = YES;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 1) {
         viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
