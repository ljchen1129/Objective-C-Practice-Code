//
//  main.m
//  常用结构体
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
 
    // 保存坐标
    CGPoint point = CGPointMake(10.0, 20.0);
    
    // 保存尺寸
    CGSize size = CGSizeMake(100.0, 100.0);
    
    // 保存坐标和尺寸
    CGRect rect = CGRectMake(point.x, point.y, size.width, size.height);
    NSLog(@"rect = %@", NSStringFromRect(rect)); // rect = {{10, 20}, {100, 100}}
    
    return 0;
}
