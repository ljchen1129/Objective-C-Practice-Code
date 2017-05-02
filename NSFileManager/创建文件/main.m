//
//  main.m
//  创建文件
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // 创建文件
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 创建二进制数据
    NSString *contentStr = @"chenliangjing";
    NSData *data = [contentStr dataUsingEncoding:NSUTF8StringEncoding];
    
    // createFileAtPath: 指定文件创建出来的位置
    // contents: 文件中的内容
    // attributes: 创建处理文件的属性
    // 该方法只能创建文件，不能用来创建文件夹
    BOOL flag = [manager createFileAtPath:@"/Users/chenliangjing/Desktop/TempDir/chenlj.txt" contents:data attributes:nil];
    if (flag)
    {
        NSLog(@"创建成功");
        NSString *content = [NSString stringWithContentsOfFile: @"/Users/chenliangjing/Desktop/TempDir/chenlj.txt" encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"content = %@", content); // content = chenliangjing
    }
    else
    {
        NSLog(@"创建失败");
    }
    
    
    return 0;
}
