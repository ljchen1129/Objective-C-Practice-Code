//
//  NSObject+Proprety.m
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "NSObject+Property.h"

@implementation NSObject (Property)

+ (void)resolveDict:(NSDictionary *)dict
{
    // 拼接属性定义
    NSMutableString *strM = [NSMutableString string];
    
    // 遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        // 记录数据类型
        NSString *type;
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")])
        {
            type = @"NSString";
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")])
        {
            type = @"NSArray";
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")])
        {
            type = @"BOOL";
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")])
        {
            type = @"NSNumber";
        }
        else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")])
        {
            type = @"NSDictionary";
        }
        
        // 属性字符串
        NSString *property;
        if ([type containsString:@"NS"])
        {
            if ([type isEqualToString:@"NSString"])
            {
                property = [NSString stringWithFormat:@"@property(nonatomic, copy) %@ *%@;", type, key];
            }
            else
            {
                property = [NSString stringWithFormat:@"@property(nonatomic, strong) %@ *%@;", type, key];
            }
        }
        else
        {
            property = [NSString stringWithFormat:@"@property(nonatomic, assign) %@ %@;", type, key];
        }
        
        [strM appendFormat:@"\n%@\n", property];
    }];
    
    NSLog(@"%@", strM);
}

@end
