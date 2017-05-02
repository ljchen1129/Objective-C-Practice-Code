//
//  main.m
//  字符串搜索
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    NSString *str = @"http://www.baidu.com";
    // 1. 判断是否以什么开头
    if ([str hasPrefix:@"http://"])
    {
        NSLog(@"是一个 url");
    }
    else
    {
        NSLog(@"不是一个 url");
    }
    
    // 2. 判断以什么结尾
    if ([str hasSuffix:@".gif"])
    {
        NSLog(@"动态图片");
    }
    else
    {
        NSLog(@"不是动态图片");
    }
    
    // 3. 判断字符串中是否包含“某个字符串”
    // 只要 str 中包含“某个字符串”，就会返回该字符串在字符串中的起始位置和长度
    NSRange range = [str rangeOfString:@"baidu"];
    NSLog(@"range.location = %lu, range.length = %lu", range.location, range.length); // range.location = 11, range.length = 5
    // 如果 str 中没有需要查找的字符串，那返回的 range 的length = 0，location = NSNotFound
    NSRange range2 = [str rangeOfString:@"google"];
    if (range2.location != NSNotFound)
    {
        NSLog(@"在 str 中找到 “baidu”");
    }
    else
    {
         NSLog(@"在 str 中没有找到 “baidu”");
         NSLog(@"range2.length = %lu", range2.length); // 0
    }
    
    return 0;
}
