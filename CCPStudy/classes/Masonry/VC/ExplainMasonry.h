//
//  ExplainMasonry.h
//  CCPStudy
//
//  Created by liqunfei on 16/9/26.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

#ifndef ExplainMasonry_h
#define ExplainMasonry_h
- (NSArray *)mas_makeConstraints:(void(^)(MASConstraintMaker *make))block;
- (NSArray *)mas_updateConstraints:(void(^)(MASConstraintMaker *make))block;
- (NSArray *)mas_remakeConstraints:(void(^)(MASConstraintMaker *make))block;
/*
 mas_makeConstraubts 新增约束，不能对一个对象同时设定两种约束，否则会报错
 mas_updateConstraints 针对上述情况，更新约束
 mas_remakeConstraints 清除之前所有约束，保留最新约束
 */

#endif /* ExplainMasonry_h */
