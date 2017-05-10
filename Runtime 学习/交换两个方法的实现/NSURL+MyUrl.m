//
//  NSURL+MyUrl.m
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "NSURL+MyUrl.h"
#import <objc/runtime.h>

@implementation NSURL (MyUrl)

// 程序启动加载类时调用
+ (void)load
{
    // 获取实例方法
    // 参数一：类对象
    // 参数二：方法名
//    class_getInstanceMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
    
    // 获取类方法
    Method oldMethod = class_getClassMethod([NSURL class], sel_registerName("URLWithString:"));
    Method currentMethod = class_getClassMethod([NSURL class], @selector(clj_urlWithString:));
    
    // 交换两个方法的实现
    method_exchangeImplementations(oldMethod, currentMethod);
}

// 交换了 URLWithString: 的实现
+ (instancetype)clj_urlWithString:(NSString *)string
{
    // 注意：交换了实现，会进入系统的实现。
    NSURL *url = [self clj_urlWithString:string];
    if (!url)
    {
        NSLog(@"url 为空！");
    }
    
    return url;
}

@end
