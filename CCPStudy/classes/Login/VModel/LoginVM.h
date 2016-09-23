//
//  LoginVM.h
//  CCPStudy
//
//  Created by liqunfei on 16/9/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginVM : NSObject
@property (nonatomic,strong) NSString *account;
@property (nonatomic,strong) NSString *secret;
@property (nonatomic,strong) NSString *loginStatus;
- (void)changeStatusWithView:(UIViewController *)view;
@end
