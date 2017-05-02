//
//  main.m
//  NSString
//
//  Created by 陈良静 on 2017/4/13.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
   
    // 1. 通过字符串常量创建
    NSString *str1 = @"张三";
    
    // 2. 通过对象方法创建
    NSString *str2 = [[NSString alloc] initWithFormat:@"李四"];
    
    // 2. 通过类工厂方法创建
    NSString *str3 = [NSString stringWithFormat:@"李四"];
    
    NSLog(@"&str2 = %p, &str3 = %p", str2, str3);
    return 0;
}
