//
//  Person.h
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

/// 只会生成属性的getter 和 setter 声明，不会生成实现以及成员变量
@property NSString *name;

@end
