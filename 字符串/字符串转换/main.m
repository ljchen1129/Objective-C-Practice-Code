//
//  main.m
//  字符串转换
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    NSString *str = @"chenLiangJing";
    // 1. 将字符串装换为大写
    NSString *newStr = [str uppercaseString];
    NSLog(@"str = %@, newStr = %@", str, newStr); // str = chenLiangJing, newStr = CHENLIANGJING
    
    // 2. 将字符串装换为小写
    newStr = [str lowercaseString];
    NSLog(@"str = %@, newStr = %@", str, newStr); // henLiangJing, newStr = chenliangjing
    
    // 3. 将字符串的首字符转换为大写
    newStr = [str capitalizedString];
    NSLog(@"str = %@, newStr = %@", str, newStr); // str = chenLiangJing, newStr = Chenliangjing
    
    // 4. 字符串与基本数据类型的转换
    NSInteger a = 10;
    NSInteger b = 10;
    newStr = [NSString stringWithFormat:@"%ld", a + b]; // newStr = 20
    NSLog(@"newStr = %@", newStr);
    
    NSString *str1 = @"30"; // 要确保装换的字符串确实可以转成想要的基本数据类型，否则会结果错误
    NSString *str2 = @"50";
    NSInteger result = [str1 integerValue] + [str2 integerValue];
    NSLog(@"result = %ld", result); // result = 80
    
    
    // 5. C 语言字符创和 Objective-C 字符串之间的转换
    // C 转 OC
    char *cStr = "clj";
    NSString *ocStr = [NSString stringWithUTF8String:cStr];
    NSLog(@"cStr = %s, ocStr = %@", cStr, ocStr); // cStr = clj, ocStr = clj
    
    // OC 转 C
    ocStr = @"chenliangjing";
    const char *newcStr = [ocStr UTF8String];
    NSLog(@"ocStr = %@, newcStr = %s", ocStr, newcStr); // ocStr = chenliangjing, newcStr = chenliangjing

    
    return 0;
}
