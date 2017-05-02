//
//  main.m
//  NSString 和 NSArray 相互转换
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // 1. 将 NSArray 中的元素按照某个连接符拼接成一个字符串
    NSArray *arr = @[@"zhangsan", @"lisi", @"wangwu"];
    NSString *result = [arr componentsJoinedByString:@"_"];
    NSLog(@"result = %@", result); // result = zhangsan_lisi_wangwu
    
    // 2. 通过字符串中的某一个连接符截取出一个字符串数组，字符串切割
    NSArray *newArr = [result componentsSeparatedByString:@"_"];
    NSLog(@"newArr = %@", newArr); // ewArr = (zhangsan, lisi, wangwu)

    
    return 0;
}
