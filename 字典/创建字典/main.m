//
//  main.m
//  创建字典
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // 1. 创建字典
    // key 和 value 是一一对应的
    NSDictionary *dic = [NSDictionary dictionaryWithObjects: @[@"chenliangjing", @"25"] forKeys: @[@"name", @"age"]];
    NSString *name = [dic objectForKey:@"name"];
    NSString *age = [dic objectForKey:@"age"];
    NSLog(@"name = %@, age = %@", name, age); // name = chenliangjing, age = 25
    
    // 简易创建（推荐使用）
    NSDictionary *dic2 = @{@"name" : @"chenliangjing", @"age" : @25};
    NSLog(@"dic2 = %@", dic2); // dic2 = { age = 25; name = chenliangjing; }
    
    
    
    return 0;
}
