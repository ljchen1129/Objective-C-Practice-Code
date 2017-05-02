//
//  Student.m
//  自定义类实现 Copy
//
//  Created by 陈良静 on 2017/4/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)copyWithZone:(NSZone *)zone
{
    // 1. 调用父类创建副本设置值
    id obj = [super copyWithZone:zone];
    // 2. 设置数据给副本
    [obj setHeight:_height];
    // 3. 返回新对象
    return obj;
}


@end
