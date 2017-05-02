//
//  main.m
//  获取文件夹下所有的文件
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 获取文件夹中所有的文件
    // 创建文件管理对象
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // 1. 不包括子文件夹下面的文件
    // 注意：contentsOfDirectoryAtPath:方法只能获取当前文件下面的资源，而不能获取子文件夹下面的资源
    NSArray *contentArr = [manager contentsOfDirectoryAtPath:@"/Users/chenliangjing/Desktop/TempDir" error:nil];
    NSLog(@"contentArr = %@", contentArr);
    
    // 2. 包括子文件夹下面的所有文件
    //    NSArray *contentAllArr = [manager1 subpathsAtPath: @"/Users/chenliangjing/Desktop/TempDir"];
    NSError *error = nil;
    NSArray *contentAllArr = [manager subpathsOfDirectoryAtPath: @"/Users/chenliangjing/Desktop/TempDir"error:&error];
    if (error)
    {
        NSLog(@"error = %@", error);
    }
    else
    {
        NSLog(@"contentAllArr = %@", contentAllArr);
    }
    
    return 0;
}
