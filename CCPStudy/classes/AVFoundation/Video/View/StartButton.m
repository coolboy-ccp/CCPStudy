//
//  StartButton.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/27.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "StartButton.h"

@implementation StartButton

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
       // self = [StartButton buttonWithType:UIButtonTypeCustom];
        self.layer.cornerRadius = frame.size.width / 2;
        self.alpha = 0.8;
        self.backgroundColor = RGBA(40, 40, 40, 1.0);
        [[self rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(UIButton *x) {
            x.selected = !x.selected;
        }];
        [self selectedLayer];
    }
    return self;
}

- (void)normalLayer {
    CGFloat w = self.bounds.size.width;
    CGFloat d = w / 2 * cos(M_PI / 6);
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake((w - d) / 2 + 2, w / 4)];
    [path addLineToPoint:CGPointMake((w - d) / 2 + d + 2, w / 2)];
    [path addLineToPoint:CGPointMake((w - d) / 2 + 2, w * 3 / 4)];
    [path closePath];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    layer.strokeColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:layer];
    NSLog(@"w:%lf,d:%lf,(w-d)/2:%lf",w,d,(w - d) / 2);
}

- (void)selectedLayer {
    UIView *v1 = [[UIView alloc] init];
    v1.backgroundColor = RGBA(255, 30, 30, 1.0);
    [self addSubview:v1];
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    v1.layer.cornerRadius = 10;
}

- (void)removeSub {
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperlayer];
    }];
}

@end
