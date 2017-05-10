//
//  Person.m
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

static NSString const *kName = @"name";

@implementation Person

- (void)setName:(NSString *)name
{
    objc_setAssociatedObject(self, &kName, name, OBJC_ASSOCIATION_COPY);
}

- (NSString *)name
{
    return objc_getAssociatedObject(self, &kName);
}

@end
