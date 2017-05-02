//
//  Student.m
//  Protocol
//
//  Created by 陈良静 on 2017/4/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Student.h"
#import "School.h"

@implementation Student
// 实现协议方法
- (void)playFootball
{
    NSLog(@"%s", __func__);
}

- (void)playBasketball
{
    NSLog(@"%s", __func__);
}

- (void)study
{
    NSLog(@"study:%s", __func__);
}

- (void)exam
{
    NSLog(@"exam:%s", __func__);
}

@end
