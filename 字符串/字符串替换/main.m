//
//  main.m
//  字符串替换
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    // 1.用制定字符串替换字符串中的子串
//    NSString *str = @"http://www.baidu.com";
//    // 将“baidu”替换为“sina”
//    NSString *newStr = [str stringByReplacingOccurrencesOfString:@"baidu" withString:@"sina"];
//    NSLog(@"str = %@, newStr = %@", str, newStr); // str = http://www.baidu.com, newStr = http://www.sina.com
    
    // 2. 去除空格
//    NSString *str = @" http://ww w.baidu.c  om ";
//    NSString *newStr = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
//    NSLog(@"str = %@, newStr = %@", str, newStr); // http://ww w.baidu.c  om , newStr = http://www.baidu.com
    
    
    // 3. 替换首尾
    NSString *str = @" ht tp://ww w.b ai du.com  ";
    // 去除首尾的空格
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    NSString *newStr = [str stringByTrimmingCharactersInSet:set];
    NSLog(@"str = %@, newStr = %@", str, newStr); // str =  ht tp://ww w.b ai du.com  , newStr = ht tp://ww w.b ai du.com
    
    // 将首尾的大写字符全部取出掉
    str = @"HTTP://www.baidu.com";
    NSCharacterSet *set2 = [NSCharacterSet uppercaseLetterCharacterSet];
    newStr = [str stringByTrimmingCharactersInSet:set2];
    NSLog(@"str = %@, newStr = %@", str, newStr); // str = HTTP://www.baidu.com, newStr = ://www.baidu.com


    
    
    return 0;
}
