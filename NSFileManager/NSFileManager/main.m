//
//  main.m
//  NSFileManager
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
 
    
    // 1. NSFileManager 类是一个单例
    NSFileManager *manager1 = [NSFileManager defaultManager];
    NSFileManager *manager2 = [NSFileManager defaultManager];
    NSLog(@"manager1 = %p, manager2 = %p", manager1, manager2); // manager1 = 0x100205710, manager2 = 0x100205710 地址一样
    
    // 2. 判断一个文件或者一个文件夹是否存在
    BOOL dirExist = [manager1 fileExistsAtPath:@"/Users/chenliangjing"];
    NSLog(@"dirExist = %i", dirExist); // dirExist = 1 ,文件夹存在
    
    BOOL fileExist = [manager1 fileExistsAtPath:@"/Users/chenliangjing/Desktop/test.plist"];
    NSLog(@"fileExist = %i", fileExist); // fileExist = 0 ,文件不存在

    // 3. 判断一个文件是否存在，并且判断它是否是一个文件夹
    BOOL dir = NO;
    // 返回值表示为：传入路径对应的文件或者文件夹是否存在
    // isDirectory：由于保存判断结果，如果是一个目录，那么就会给 dir 赋值为 YES，如果不是就赋值 NO
    BOOL flag = [manager1 fileExistsAtPath:@"/Users/chenliangjing/Desktop/test.plist" isDirectory:&dir];
    NSLog(@"flag = %i, dir = %i", flag, dir); // flag = 1, dir = 0，文件存在，但不是一个文件夹
    
    

    
    
    

    
    return 0;
}
