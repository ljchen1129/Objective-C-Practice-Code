//
//  Person.m
//  自定义类实现 Copy
//
//  Created by 陈良静 on 2017/4/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

- (id)copyWithZone:(NSZone *)zone
{
    // 1. 创建一个新的对象
    Person *p = [[[self class] alloc] init];
    // 2. 设置当前对象内容给新对象
//    p.dog = [_dog copyWithZone:zone]; // 对象类型属性
    p.dog = _dog;
    p.name = _name;
    
    // 3. 返回新对象
    return p;
}

@end
