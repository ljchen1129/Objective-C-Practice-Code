//
//  Student.m
//  熟悉 OC- 对象内存模型
//
//  Created by 陈良静 on 2017/3/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "LJStudent.h"

@implementation LJStudent 

+ (instancetype)student
{
    id obj = [[[self class] alloc] init]; // 生成对象并自己持有
    [obj autorelease]; // 对象存在但自己不持有对象
    
    return obj;
}

@end
