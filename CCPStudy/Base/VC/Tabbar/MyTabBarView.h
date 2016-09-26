//
//  MyTabBarView.h
//  CCPStudy
//
//  Created by liqunfei on 16/9/26.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabbarButton.h"

@interface MyTabBarView : UIView
@property (nonatomic,strong) TabbarButton *selectedBtn;
- (void)addTabBarButtonWithTabBarItem:(UITabBarItem *)tabBarItem;

@end
