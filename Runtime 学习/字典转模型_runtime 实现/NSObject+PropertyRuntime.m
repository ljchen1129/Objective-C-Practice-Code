//
//  NSObject+PropertyRuntime.m
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "NSObject+PropertyRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (PropertyRuntime)

+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    // 1. 遍历model所有的属性列表
    
    // 1.1. 创建对应的对象
    id obj = [[self alloc] init];
    
    // 获取类中的所有成员属性
    // 参数一：从哪个类中获取
    // 参数二：这个类有多少成员属性，传入一个无符号 int，会自动给这个变量赋值
    // 返回值：Ivar *，表示一个 Ivar 数组，会把所有成员属性放在一个数组中，通过返回的数组就能全部获取到
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([obj class], &count);
    
    for (int i = 0; i < count; i++)
    {
        // 根据下标获取对应的成员属性
        Ivar ivar = ivarList[i];
        
        // 获取成员属性名
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 从第 1 个下标开始截取
        NSString *key = [ivarName substringFromIndex:1];
        
        // 根据成员属性名去字典中查找对应的value
        id value = dict[key];
        
        // 获取成员属性类型
        NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        // 去掉转义字符。生成的是这种@"@\"User\"" 类型 -》 @"User"  在OC字符串中 \" -> "，\是转义的意思，不占用字符
        type = [type stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        type = [type stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        // 二级转换：如果字典中还有字典，也需要把对应的字典转换成模型
        // 数据是字典类型以及是自定义数据类型才需要再做一层字典转模型
        if ([value isKindOfClass: [NSDictionary class]] && ![type hasPrefix:@"NS"])
        {
            // 继续字典转模型
            // 根据字符串类名生成类对象
            Class modelCalss = NSClassFromString(type);
            
            // 有对应模型才需要转
            if (modelCalss)
            {
                value = [modelCalss modelWithDict:value];
            }
        }
        
        // 三级转换：NSArray中也是字典，把数组中的字典转换成模型.
        if ([value isKindOfClass:[NSArray class]])
        {
            // 判断对应类有没有实现字典数组转模型数组的协议
            if ([self respondsToSelector:@selector(arrayContainModelClass)])
            {
                // 转换成id类型，就能调用任何对象的方法
                id idSelf = self;
                
                // 获取数组中对应字典的模型
                 Class modelClass = [idSelf arrayContainModelClass][key];
                if (modelClass)
                {
                    NSMutableArray *arrM = [NSMutableArray array];
                    for (NSDictionary *dict in value)
                    {
                        id model = [modelClass modelWithDict:dict];
                        [arrM addObject:model];
                    }
                    
                    value = arrM;
                }
            }
        }
        
        // 给模型中的属性赋值
        if (value)
        {
            [obj setValue:value forKey:key];
        }
        
    }
    
    return obj;
}

@end
