//
//  main.cpp
//  字符串—文件写入
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // 文件写入
    NSString *str = @"chenliangjing";
    NSString *path = @"/Users/chenliangjing/Desktop/test.txt";
    NSError *error = nil;
    [str writeToURL:[NSURL fileURLWithPath:path] atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"写入失败");
        NSLog(@"error = %@", error);
    } else {
        NSLog(@"写入成功");
    }
    
    
}
