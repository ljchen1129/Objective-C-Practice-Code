//
//  NSObject+KVCImplecation.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "NSObject+KVCImplecation.h"
#import <objc/runtime.h>

@implementation NSObject (KVCImplecation)

- (void)clj_setValue:(id)value forKey:(NSString *)key
{
    // 1. 判断 key 是否异常
    if (key == nil || key.length == 0)
    {
        return;
    }
    
    // 2. 对非对象类型判断 value 是否为 nil
    if ([value isKindOfClass:[NSNull class]] || value == nil)
    {
        [self clj_setNilValueForKey:key]; //
        return;
    }
    
    // 3. 判断是否为对象类型
    if (![value isKindOfClass:[NSObject class]])
    {
        //
        @throw @"must be NSObject Type";
        return;
    }

    // 4. 判断是否实现了 setter (set<Key> -> setIs<key>)方法，如果有 setter 方法，那么直接执行 setter 方法
    NSString *funcName1 = [NSString stringWithFormat:@"set%@", key.capitalizedString];
    SEL sel1 = NSSelectorFromString(funcName1);
    if ([self respondsToSelector:sel1])
    {
        [self performSelector:sel1 withObject:value];
        return;
    }

    NSString *funcName2 = [NSString stringWithFormat:@"setIs%@", key.capitalizedString];
    SEL sel2 = NSSelectorFromString(funcName2);
    if ([self respondsToSelector:sel2])
    {
        [self performSelector:sel2 withObject:value];
        return;
    }
    
    // 5. 判断是否允许访问成员变量
    if ([[self class] clj_accessInstanceVariablesDirectly])
    {
        // 访问成员变量（_key -> _isKey -> key -> isKey）
        unsigned int count;
        Ivar* ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i++)
        {
            Ivar ivar = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
            NSString *keyName = ivarName;
            BOOL findKeySuccessed = NO;

            // 5.1 先找 _key 成员变量
            if ([keyName isEqualToString:[NSString stringWithFormat:@"_%@", key]])
            {
                // 给成员变量设置值
                object_setIvar(self, ivar, value);
                findKeySuccessed = YES;
                break;
            }
            
            // 5.2. 找 _isKey 成员变量
            if ([keyName isEqualToString:[NSString stringWithFormat:@"_is%@", key.capitalizedString]])
            {
                object_setIvar(self, ivar, value);
                findKeySuccessed = YES;
                break;
            }
            
            // 5.3 找 key 的成员变量
            if ([keyName isEqualToString:key])
            {
                object_setIvar(self, ivar, value);
                findKeySuccessed = YES;
                break;
            }
            
            // 5.4. 找 isKey 成员变量
            if ([keyName isEqualToString:[NSString stringWithFormat:@"is%@", key.capitalizedString]])
            {
                object_setIvar(self, ivar, value);
                findKeySuccessed = YES;
                break;
            }
            
            // 5.5. 如果还是没有找到相关的成员变量
            if (!findKeySuccessed)
            {
                [self clj_setValue:value forUndefinedKey:key];
            }

        }
    }
    else
    {
        [self clj_setValue:value forUndefinedKey:key];
    }
}

- (id)clj_valueForKey:(NSString *)key
{
    // 1. 判断 key 是否为空
    if (key == nil || key.length == 0)
    {
        return nil;
    }
    
    // 2. 判断是否存在相应的 getter 方法（getKey> -> key -> isKey）
    NSString *funcName1 = [NSString stringWithFormat:@"get%@", key.capitalizedString];
    SEL sel1 = NSSelectorFromString(funcName1);
    if ([self respondsToSelector:sel1])
    {
        return [self performSelector:sel1];
    }
    
    SEL sel2 = NSSelectorFromString(key);
    if ([self respondsToSelector:sel2])
    {
        return [self performSelector:sel2];
    }

    NSString *funcName3 = [NSString stringWithFormat:@"is%@", key.capitalizedString];
    SEL sel3 = NSSelectorFromString(funcName1);
    if ([self respondsToSelector:sel3])
    {
        return [self performSelector:sel3];
    }
    
    // 3. 判断是否允许访问成员变量
    if ([[self class] clj_accessInstanceVariablesDirectly])
    {
        // 4. 访问成员变量（_key -> _isKey -> key -> isKey）
        unsigned int count;
        Ivar* ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i ++)
        {
            Ivar ivar = ivars[i];
            NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
            NSString *keyName = ivarName;
            BOOL findKeySuccessed = NO;
            
            // 4.1. 先找 _key 成员变量
            if ([keyName isEqualToString:[NSString stringWithFormat:@"_%@", key]])
            {
                NSLog(@"_key = %@", [NSString stringWithFormat:@"_%@", key.capitalizedString]);
                findKeySuccessed = YES;
                
                // 获取成员变量的值
                return object_getIvar(self, ivar);
                break;
            }
            
            // 4.2. 找 _isKey 成员变量
            if ([keyName isEqualToString:[NSString stringWithFormat:@"_is%@", key.capitalizedString]])
            {
                findKeySuccessed = YES;
                return object_getIvar(self, ivar);
                break;
            }

            // 4.3. 找 key 成员变量
            if ([keyName isEqualToString:key])
            {
                NSLog(@"key = %@", key);
                findKeySuccessed = YES;
                return object_getIvar(self, ivar);
                break;
            }

            // 4.4. 找 isKey 成员变量
            if ([keyName isEqualToString:[NSString stringWithFormat:@"is%@", key.capitalizedString]])
            {
                findKeySuccessed = YES;
                return object_getIvar(self, ivar);
                break;
            }
            
            if (!findKeySuccessed)
            {
                [self clj_valueForUndefinedKey:key];
            }
        }
        
    }
    else
    {
        [self clj_valueForUndefinedKey:key];
    }

    return nil;
}

+ (BOOL)clj_accessInstanceVariablesDirectly
{
    NSLog(@"category");
    return YES;
}

@end
