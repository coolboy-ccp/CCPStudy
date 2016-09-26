//
//  LocalConstant.h
//  CCPStudy
//
//  Created by liqunfei on 16/9/22.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#ifndef LocalConstant_h
#define LocalConstant_h

#define RGBA(r,g,b,a)      [UIColor colorWithRed:r / 255.0 green:g / \
255.0 blue:b / 255.0 alpha:a]

#define CGRGBA(r,g,b,a)    [UIColor colorWithRed:r / 255.0 green:g / \
255.0 blue:b / 255.0 alpha:a].CGColor

#define MainScreen_bounds  [UIScreen mainScreen].bounds
#define Main_width         [UIScreen mainScreen].bounds.size.width
#define Main_height        [UIScreen mainScreen].bounds.size.height
#define WS(weakSelf)       __weak __typeof(&*self)weakSelf = self
#define BS(blockSelf)      __block __typeof(&*self)blockSelf = self
#define SS(strongSelf)     __strong __typeof(&*self)strongSelf = self

#endif /* LocalConstant_h */
