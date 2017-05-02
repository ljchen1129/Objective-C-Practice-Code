//
//  CustomOpreation.m
//  iOS 多线程-NSOperation
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "CustomOpreation.h"

@implementation CustomOpreation

// 自定义 Opreation 需要重写 main 方法，将需要执行的任务封装到 main 方法中
- (void)main
{
    for (int i = 0; i < 1000; i ++)
    {
        NSLog(@"CustomOpreation1------%zd---%@", i, [NSThread currentThread]);
    }
    
    if (self.isCancelled) return;
    
    for (int i = 0; i < 1000; i ++)
    {
        NSLog(@"CustomOpreation2------%zd---%@", i, [NSThread currentThread]);
    }
    
    if (self.isCancelled) return;

    for (int i = 0; i < 1000; i ++)
    {
        NSLog(@"CustomOpreation3------%zd---%@", i, [NSThread currentThread]);
    }
    
    if (self.isCancelled) return;
}

@end
