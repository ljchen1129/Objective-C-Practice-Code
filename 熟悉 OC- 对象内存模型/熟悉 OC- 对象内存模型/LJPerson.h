//
//  Person.h
//  熟悉 OC- 对象内存模型
//
//  Created by 陈良静 on 2017/3/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LJStudent; // 向前声明

@protocol LJPersonSleeping <NSObject>

- (void)LJPersonSleeping:(LJStudent *)student;

@end

@interface LJPerson : NSObject

/// 姓名
@property(nonatomic, copy) NSString *name;
/// 年龄
@property(nonatomic, assign) NSUInteger age;
/// 学生
@property(nonatomic, strong) LJStudent *stu;

@end
