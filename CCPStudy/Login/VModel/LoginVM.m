//
//  LoginVM.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "LoginVM.h"

@implementation LoginVM
    
    -(NSString *)account {
        if (!_account) {
            _account = @"";
        }
        return _account;
    }
    
    - (NSString *)secret {
        if (!_secret) {
            _secret = @"";
        }
        return _secret;
    }

@end
