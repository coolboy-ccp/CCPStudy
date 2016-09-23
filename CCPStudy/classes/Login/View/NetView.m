//
//  NetView.m
//  CCPStudy
//
//  Created by liqunfei on 16/9/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#import "NetView.h"

@interface NetView ()

@end

@implementation NetView

- (void)drawRect:(CGRect)rect {
    [self cgreateWIFI];
}
    
- (void)cgreateWIFI {
        CGContextRef ctx1 = UIGraphicsGetCurrentContext();
        CGContextAddArc(ctx1, self.frame.size.width / 2 - 5, self.frame.size.height - 5, 5, 0, M_PI * 2, 0);
        [self.color setFill];
        CGContextFillPath(ctx1);
    
        CGContextRef ctx2 = UIGraphicsGetCurrentContext();
        CGContextAddArc(ctx2, self.frame.size.width / 2 - 5, self.frame.size.height - 5, 15, M_PI * 5 / 4, M_PI * 7 / 4, 0);
        [self.color setStroke];
        CGContextSetLineWidth(ctx2, 5);
        CGContextStrokePath(ctx2);
    
        CGContextRef ctx3 = UIGraphicsGetCurrentContext();
        CGContextAddArc(ctx3, self.frame.size.width / 2 - 5, self.frame.size.height - 5, 25, M_PI * 5 / 4, M_PI * 7 / 4, 0);
        [self.color setStroke];
        CGContextSetLineWidth(ctx3, 5);
        CGContextStrokePath(ctx3);
}
    
- (UIColor *)color {
    if (!_color) {
        _color = RGBA(200, 220, 220, 1.0);
    }
    return _color;
}
    

@end
