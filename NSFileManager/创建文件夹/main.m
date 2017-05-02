//
//  main.m
//  创建文件夹
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
 
    // 创建文件夹
    NSFileManager *manager = [NSFileManager defaultManager];
    
    // DirectoryAtPath: 文件夹创建的位置
    // withIntermediateDirectories: 如果指定的文件夹中有一些文件夹不存在，是否自动创建不存在的文件夹
    // attributes: 指定创建出来的文件夹的属性
    // error: 是否创建成功，如果失败会给传入的参数赋值
    // 注意：该方法只能创建文件夹，不能用来创建文件
    [manager createDirectoryAtPath:@"/Users/chenliangjing/Desktop/chenlj" withIntermediateDirectories:YES attributes:nil error:nil];
    
    
    
    
    return 0;
}
