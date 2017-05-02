//
//  main.m
//  获取文件或者文件夹属性
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    // 获取文件或者文件夹的属性
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDictionary *info = [manager attributesOfItemAtPath:@"/Users/chenliangjing/Desktop/TempDir" error:nil];
    NSLog(@"info = %@", info);
    
    return 0;
}
