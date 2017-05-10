//
//  NSObject+PropertyRuntime.h
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelDelegate <NSObject>

@optional
// 提供一个协议，只要遵守这个协议的类，都能把数组中的字典转模型
// 用在三级数组转换
+ (NSDictionary *)arrayContainModelClass;

@end

@interface NSObject (PropertyRuntime)

/// 字典转模型
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
