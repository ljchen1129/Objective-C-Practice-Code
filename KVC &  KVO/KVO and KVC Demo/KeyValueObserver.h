//
//  KeyValueObserver.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/14.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyValueObserver : NSObject

/// 添加观察者
+ (NSObject *)observeObject:(NSObject *)object forKeyPath:(NSString *)keyPath target:(id)target selector:(SEL)sel;

+ (NSObject *)observeObject:(NSObject *)object forKeyPath:(NSString *)keyPath target:(id)target selector:(SEL)sel options:(NSKeyValueObservingOptions)options;

@end
