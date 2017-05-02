//
//  main.m
//  可变字符串
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
   
    NSMutableString *mStr = [NSMutableString stringWithFormat:@"chen"];
    NSLog(@"mStr = %@", mStr); // mStr = chen
    
    // 1. 在字符串后面添加字符串
    [mStr appendString:@"liangjing"];
    NSLog(@"mStr = %@", mStr); // mStr = chenliangjing
    [mStr appendFormat:@"'s age is %i", 25];
    NSLog(@"mStr = %@", mStr); // mStr = chenliangjing's age is 25
    
    
    // 2. 删除字符串
    NSRange delRange = [mStr rangeOfString:@"'s age is 25"];
    [mStr deleteCharactersInRange:delRange];
    NSLog(@"mStr = %@", mStr); // chenliangjing
    
    // 3. 插入字符串
    NSRange insRange = [mStr rangeOfString:@"liangjing"];
    [mStr insertString:@"_" atIndex:insRange.location];
    NSLog(@"mStr = %@", mStr); // mStr = chen_liangjing
    
    // 4. 替换字符串
    // 调用父类 NSString 的替换字符串方法，返回一个新的字符串，不修改原来的字符串
    NSString *newStr = [mStr stringByReplacingOccurrencesOfString:@"_" withString:@""];
    NSLog(@"mStr = %@, newStr = %@", mStr, newStr); // chen_liangjing, newStr = chenliangjing
    
    // 调用 NSMutableString 的替换方法
    NSRange repRange = [mStr rangeOfString:@"_liangjing"];
    
    // OccurrencesOfString: 需要替换的字符串
    // withString: 用什么字符串替换
    // options: 替换是的搜索方式
    // range: 搜索的范围
    // 返回值: 表示替换了多少个字符串
    NSUInteger count = [mStr replaceOccurrencesOfString:@"_" withString:@"" options:0 range:repRange];
    NSLog(@"mStr = %@", mStr); // mStr = chenliangjing
    NSLog(@"count = %ld", count); // count = 1
    
    
    
    
    
    
    return 0;
}
