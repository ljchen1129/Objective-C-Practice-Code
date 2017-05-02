//
//  main.m
//  字符串截取
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
   
    NSString *str = @"<head>陈良静</head>";
//    // 默认从第一个字符开始找
//    NSUInteger location = [str rangeOfString:@">"].location + 1;
//    // NSBackwardsSearch，从最后一个字符开始找
//    NSUInteger length = [str rangeOfString:@"<" options:NSBackwardsSearch].location - location;
//    NSRange range = NSMakeRange(location,length);
//    NSString *newStr = [str substringWithRange:range];
//    NSLog(@"str = %@, newStr = %@", str, newStr);
    
    // 2. 从什么位置开始截取，一直截取到最后
    // 默认从第一个字符开始找
    NSUInteger fromLocation = [str rangeOfString:@">"].location + 1;
    NSString *newStr = [str substringFromIndex:fromLocation];
    NSLog(@"str = %@, newStr = %@", str, newStr); // <head>陈良静</head>, newStr = 陈良静</head>
    
    // 3. 从开头开始截取，一直截取到什么位置
    NSUInteger toLocation = [newStr rangeOfString:@"<"].location;
    newStr = [newStr substringToIndex:toLocation];
    NSLog(@"str = %@, newStr = %@", str, newStr); // <head>陈良静</head>, newStr = 陈良静
    
    return 0;
}
