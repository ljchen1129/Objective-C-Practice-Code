//
//  StatusModel.m
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "StatusModel.h"

@implementation StatusModel

+ (instancetype)statusWithDict:(NSDictionary *)dict
{
    StatusModel *model = [[StatusModel alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

// 重写该方法，如果找不到 key
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    // 让 “idstr” 这个 key 的 value 设置给 “idst” 属性
    if ([key isEqualToString:@"idstr"])
    {
        [self setValue:value forKey:@"idst"];
    }
}

@end
