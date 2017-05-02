//
//  main.m
//  字典文件读写
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    
    NSDictionary *dic = @{@"name" : @"chenliangjing", @"age" : @25, @"height" : @1.70};
    
    // 1. 写入文件
    BOOL flag = [dic writeToFile:@"/Users/chenliangjing/Desktop/test.plist" atomically:YES];
    if (flag)
    {
        NSLog(@"写入成功");
    }
    else
    {
        NSLog(@"写入失败");
    }
    
    // 2. 从文件中读取
    NSDictionary *newDic = [NSDictionary dictionaryWithContentsOfFile:@"/Users/chenliangjing/Desktop/test.plist"];
    NSLog(@"newDic = %@", newDic); 
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
