//
//  Person.h
//  数组
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 食物
@property(nonatomic, copy) NSString *food;

@property(nonatomic, assign) NSUInteger age;

// 吃饭
- (void)eatWithFood:(NSString *)food;

@end
