//
//  main.m
//  字符串
//
//  Created by 陈良静 on 2017/4/16.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"

int main(int argc, const char * argv[]) {
    
//    // 1. 通过字符串常量创建，存储在`常量区`中
//    NSString *str1 = @"张三";
//    
//    // 2. 通过对象方法创建
//    NSString *str2 = [[NSString alloc] initWithFormat:@"李四"];
//    
//    // 2. 通过类工厂方法创建
//    NSString *str3 = [NSString stringWithFormat:@"李四"];
//    
//    NSString *str1 = @"chenliangjing";
//    NSString *str2 = @"chenliangjing";
//    
//    NSLog(@"&str1 = %p, &str2 = %p", str1, str2);
    
    // 字符串读取
    // 1. 从文件中读取
    /**
     file：文件路径，绝对路径
     encoding: 字符编码，一般写 UTF-8
     */
    NSError *error = nil;
//    NSString *str = [NSString stringWithContentsOfFile:@"/Users/chenliangjing/Desktop/test.txt" encoding:NSUTF8StringEncoding error:&error];
//    if (error == nil)
//    {
//        NSLog(@"str = %@",str);
//    }
//    else
//    {
//        NSLog(@"error = %@", [error localizedDescription]);
//    }
    
//    // 将字符串写入文件中
//    NSDate *now = [NSDate date];
//    NSString *str = [NSString stringWithFormat:@"%@", now];
//    
//    // atomically:如果YES，字符串写入文件的过程如果没有写完，那么不会生成文件
//    //            如果NO，字符串写入文件的过程如果没有写完，会生成文件
//    [str writeToFile:@"/Users/chenliangjing/Desktop/test.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
//    if (error == nil)
//    {
//        NSLog(@"str = %@",str);
//    }
//    else
//    {
//        NSLog(@"error = %@", [error localizedDescription]);
//    }

    // 根据 URL 从文件中读取字符串
    // 1. 创建 URL
    // 协议头 + 主机地址 + 文件路径
//    NSString *path = @"file://192.168.0.100/Users/chenliangjing/Desktop/test.txt";
//    NSURL *url = [NSURL URLWithString:path];
    
//    NSString *path = @"file:/Users/chenliangjing/Desktop/test.txt"; // 如果资源是在本机地址获取的，那么 URL 的主机地址可以省略
//    NSURL *url = [NSURL URLWithString:path];
   
    NSString *path = @"/Users/chenliangjing/Desktop/test.txt"; // 如果是通过 fileURLWithPath: 方法创建 URL，则协议头也不用写，系统会自动添加协议头（file://）
    NSURL *url = [NSURL fileURLWithPath:path];

    
//    // 2. 根据 URL 加载文件中的字符串
//    NSString *str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
//    if (error == nil)
//    {
//        NSLog(@"str = %@", str);
//    }
//    else
//    {
//        NSLog(@"error = %@", [error localizedDescription]);
//    }
    
//    int data1[] = {1, 2, 3, 4};
//    int size1 = sizeof(data1);
//    int *data2 = data1;
//    int size2 = sizeof(data2);
//    
//    printf("size1 = %d, size2 = %d\n", size1,size2); // 16, 8
    
    
//    NSMutableString *string = [NSMutableString stringWithFormat:@"zhangsan"];
//    Test *test = [[Test alloc] init];
//    test.string = string;
//    NSLog(@"string = %@ test.string = %@", string, test.string);
//    [string appendFormat:@" lisi"];
//    NSLog(@"string = %@ test.string = %@", string, test.string);
    
    NSString *path2 = @"/Users/陈良静/Desktop/test.txt";
    NSString *nPath = [path2 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    NSURL *url2 = [NSURL URLWithString:nPath];
    NSLog(@"url2 = %@", url2);
    
    return 0;
}
