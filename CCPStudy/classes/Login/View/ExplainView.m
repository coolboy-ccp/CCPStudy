//
//  ExplainView.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/23.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "ExplainView.h"

@implementation ExplainView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self shadow];
        [self label];
        self.layer.cornerRadius = 10.0;
    }
    return self;
}


- (void)shadow {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-5, -5, self.bounds.size.width, self.bounds.size.height) cornerRadius:10.0];
    self.layer.shadowColor = RGBA(220, 220, 240, 1.0).CGColor;
    self.layer.shadowOffset = CGSizeMake(5, 5.0);
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = path.CGPath;
}

- (void)label {
    NSArray *title = @[@"explain",@"input a1, aaa skip to first",@"input a2, aaa skip to second",@"input a3, aaa skip to third"];
    for (int i = 0; i < title.count; i ++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 10 + i * 26, self.bounds.size.width - 10, 21)];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = title[i];
        label.font = [UIFont systemFontOfSize:14.0];
        label.textColor = RGBA(190, 190, 190, 1.0);
        if (i == 0) {
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:18.0];
            label.textColor = RGBA(91, 91, 91, 1.0);
        }
        [self addSubview:label];
    }
}

@end
