//
//  NSObject+KVCImplecation.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVCImplecation)

// 设置值
- (void)clj_setValue:(id)value forKey:(NSString *)key;
// 取值
- (id)clj_valueForKey:(NSString *)key;

// 是否从成员变量获取
+ (BOOL)clj_accessInstanceVariablesDirectly;

// 设置值异常处理：找不到key
- (void)clj_setValue:(id)value forUndefinedKey:(NSString *)key;
// 取值异常处理：找不到key
- (id)clj_valueForUndefinedKey:(NSString *)key;

// 处理value 为 nil 的情况
- (void)clj_setNilValueForKey:(NSString *)key;

@end
