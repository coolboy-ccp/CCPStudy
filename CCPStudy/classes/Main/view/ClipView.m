//
//  ClipView.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/23.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "ClipView.h"

@interface ClipView ()
@property (nonatomic,assign) CGPoint centerP;

@end

@implementation ClipView


- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        self.backgroundColor = RGBA(20, 20, 20, 0.5);
        [self createImgMask];
    }
    return self;
}



- (void)createImgMask {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width / 2 - 75, self.bounds.size.height / 2 - 50, 150, 100)];
    label.text = @"滑动有惊喜";
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:20];
    label.tag = 1001;
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:self.bounds];
    imgV.image = [UIImage imageNamed:@"main1.jpg"];
    [self addSubview:imgV];
    [self addSubview:label];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    __block UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(self.bounds.size.width / 2, self.bounds.size.height / 2, 0, 0)];
    __block CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = path.CGPath;
    imgV.layer.mask = maskLayer;
    [[pan rac_gestureSignal] subscribeNext:^(UIPanGestureRecognizer *x) {
        if ([self viewWithTag:1001]) {
            [[self viewWithTag:1001] removeFromSuperview];
        }
        CGPoint pt = [x locationInView:self];
        if ([path containsPoint:pt]) {
            return ;
        }
        [path addArcWithCenter:pt radius:50 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        maskLayer.path = path.CGPath;
        imgV.layer.mask = maskLayer;
    }];
    [self  addGestureRecognizer:pan];
}


@end
