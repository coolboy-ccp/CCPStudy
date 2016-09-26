//
//  MyTabBarView.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/26.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "MyTabBarView.h"


@interface MyTabBarView ()
@property (nonatomic,strong) NSMutableArray *tabBtnArray;
@property (nonatomic,strong) UIButton *homeBtn;


@end

@implementation MyTabBarView

- (instancetype)init {
    if ([super init]) {
        self.tabBtnArray = [NSMutableArray array];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width / (self.subviews.count);
    for (int i = 0; i < self.tabBtnArray.count; i ++) {
        CGFloat btnX = btnW * i;
        TabbarButton *btn = self.tabBtnArray[i];
        btn.frame = CGRectMake(btnX,btnY, btnW, self.bounds.size.height);
        btn.tag = i;
    }
}

- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tabBarItem {
    TabbarButton *btn = [[TabbarButton alloc] init];
    btn.tabBarItem = tabBarItem;
    [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    [self.tabBtnArray addObject:btn];
    if (self.tabBtnArray.count == 1) {
        [self clickButton:btn];
    }
}

- (void)clickButton:(TabbarButton *)btn {
    btn.selected = YES;
    self.selectedBtn = btn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
