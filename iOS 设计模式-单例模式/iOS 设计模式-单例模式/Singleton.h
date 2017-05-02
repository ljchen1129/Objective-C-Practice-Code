//
//  Singleton.h
//  iOS 设计模式-单例模式
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h


// .h 文件
#define SingletonH(name) + (instancetype)shared##name;

// .m 文件
#define SingletonM(name) \
static id _instance;\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [super allocWithZone:zone];\
    });\
    \
    return _instance;\
}\
\
+ (instancetype)shared##name\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [[self alloc] init];\
    });\
    \
    return _instance;\
} \
\
- (id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}











#endif /* Singleton_h */
