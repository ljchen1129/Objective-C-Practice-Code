//
//  Person.m
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

// 当类调用了一个没有实现的类方法时，会来到这个方法
+ (BOOL)resolveClassMethod:(SEL)sel
{
    return YES;
}

// 当类调用了一个没有实现的实例方法时，会来到这个方法
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"sel = %@", NSStringFromSelector(sel));
    if (sel == sel_registerName("eat:"))
    {
        // 动态给类添加方法
        // 参数一：类对象
        // 参数二：方法编号
        // 参数三：方法实现，函数指针，指向函数的实现
        // 参数四：返回值类型，
        class_addMethod(self, sel, (IMP)eat, "v:@@");
    }
    
    return [super resolveInstanceMethod:sel];
}

// 给 Person 实例对象动态添加 eat 方法
void eat(id self, SEL _cmd, id food)
{
    NSLog(@"Person 吃了%@！", food);
}

@end
