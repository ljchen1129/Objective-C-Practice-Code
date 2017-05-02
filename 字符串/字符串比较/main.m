//
//  main.m
//  字符串比较
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    NSString *str1 = @"zhangsan";
    NSString *str2 = @"lisi";
    
    // 1. 比较两个字符串的“内容”是否相同
    bool flag = [str1 isEqualToString:str2];
    NSLog(@"flag = %i", flag);
    
    // 2. 比较两个字符串的”地址“是否相同
    flag = (str1 == str2);
    
    
    // 3. 比较两个字符串大小，比较的 ACCIC 码值
    // NSOrderedAscending 升序，前面的小于后面的
    // NSOrderedSame, 相等
    // NSOrderedDescending 降序，前面的大于后面的
    switch ([str1 compare:str2]) {
        case NSOrderedAscending:
            NSLog(@"str1 小于 str2");
            break;
        case NSOrderedSame:
            NSLog(@"str1 等于 str2");
            break;
        case NSOrderedDescending:
            NSLog(@"str1 大于 str2");
            break;
        default:
            break;
    };
    
    
    // 4. 忽略大小写进行比较
    NSString *str3 = @"zhangsan";
    NSString *str4 = @"ZHANGSAN";

    switch ([str3 caseInsensitiveCompare:str4]) {
        case NSOrderedAscending:
            NSLog(@"str3 小于 str4");
            break;
        case NSOrderedSame:
            NSLog(@"str3 等于 str4");
            break;
        case NSOrderedDescending:
            NSLog(@"str3 大于 str4");
            break;
        default:
            break;
    };
    
    
    return 0;
}
