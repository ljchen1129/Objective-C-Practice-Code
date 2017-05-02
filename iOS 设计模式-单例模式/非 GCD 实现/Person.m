//
//  Person.m
//  iOS 设计模式-单例模式
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"

@interface Person () <NSCopying>

@end
@implementation Person

static id _instance;

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    // 加锁，保证线程安全
    @synchronized (self)
    {
        if (_instance == nil)
        {
            _instance = [super allocWithZone:zone];
        }
    }
    
    return _instance;
}

+ (instancetype)sharedInstance
{
    // 加锁，保证线程安全
    @synchronized (self) {
        if (_instance == nil)
        {
            _instance = [[self alloc] init];
        }
    }
    
    return _instance;

}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

@end
