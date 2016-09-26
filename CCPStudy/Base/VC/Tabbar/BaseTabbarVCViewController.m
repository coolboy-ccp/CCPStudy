//
//  BaseTabbarVCViewController.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/26.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "BaseTabbarVCViewController.h"
#import "MusicViewController.h"
#import "VideoViewController.h"
#import "QRCodeViewController.h"
#import "PhotoViewController.h"
#import "MyTabBarView.h"
#import "TabNavViewController.h"

@interface BaseTabbarVCViewController ()
@property (nonatomic,strong) MyTabBarView *myTabBar;
@end

@implementation BaseTabbarVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpMainBar];
    [self setUpControllers];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    for (UIView *obj in self.tabBar.subviews) {
        if ([obj isKindOfClass:[UIControl class]]) {
            [obj removeFromSuperview];
        }
    }
}

- (void)setUpMainBar {
    self.myTabBar = [[MyTabBarView alloc] init];
    self.myTabBar.frame = self.tabBar.bounds;
    [RACObserve(self.myTabBar, selectedBtn) subscribeNext:^(TabbarButton *x) {
        self.selectedIndex = x.tag;
    }];
    [self.tabBar addSubview:self.myTabBar];
}

- (void)setUpControllers {
    NSArray *titles = @[@"视频", @"照片", @"二维码", @"音乐"];
    NSArray *imgs = @[@"vieo", @"photo", @"qrcode", @"music"];
    NSArray *selectedImgs = @[@"video_selected", @"photo_selected", @"qrcode_selected", @"music_selected"];
    MusicViewController *music = [[MusicViewController alloc] init];
    VideoViewController *video = [[VideoViewController alloc] init];
    QRCodeViewController *qr = [[QRCodeViewController alloc] init];
    PhotoViewController *photo = [[PhotoViewController alloc] init];
    NSArray *VCs = @[video,photo,qr,music];
    for (int i = 0; i < VCs.count; i ++) {
        [self setUpchildVC:VCs[i] title:titles[i] image:imgs[i] selectedImage:selectedImgs[i]];
    }
}

- (void)setUpchildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)imageName selectedImage:(NSString *)selectedImageName {
    TabNavViewController *nav = [[TabNavViewController alloc] initWithRootViewController:childVC];
    childVC.tabBarItem.image = [UIImage imageNamed:imageName];
    childVC.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    childVC.tabBarItem.title = title;
    [self.myTabBar addTabBarButtonWithTabBarItem:childVC.tabBarItem];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
