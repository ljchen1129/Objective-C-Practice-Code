//
//  main.m
//  NSArray 文件读写
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[]) {

    // 1. 将数组写入到文件中
    NSArray *arr = @[@"zhangsan", @"lisi", @"wangwu"];
    
    // 如果将一个数组写入文件中，本质是写入了一个 XML 文件，一般情况下，会将 XML 文件的扩展名保存为 plist，因为比较方便查看
    bool flag = [arr writeToFile:@"/Users/chenliangjing/Desktop/temp.plist" atomically:YES];
    NSLog(@"flag = %i", flag);
    
    // 2. 从文件中读取一个数组
    NSArray *getArr = [NSArray arrayWithContentsOfFile:@"/Users/chenliangjing/Desktop/temp.plist"];
    NSLog(@"getArr = %@", getArr); // getArr = (zhangsan, lisi, wangwu)

    
    return 0;
}
