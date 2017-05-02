//
//  main.m
//  数组遍历
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    NSArray *arr = @[@"zhangsan", @"lisi", @"wangwu"];
    
    // 1. 常规遍历
    for (int i = 0; i < arr.count; i ++ )
    {
        NSLog(@"arr[%i] = %@", i, arr[i]);
    }
    
    // 2. 增强 for 循环
    // 逐个取出 arr 中的元素，将元素赋值给 obj
    for (NSString *str in arr)
    {
        NSLog(@"str = %@", str);
    }
    
    // 3. 使用数组迭代器遍历(推荐使用)
    // 每取出一个元素就会调用一次block
    // 每次调用 block 都会将当前取出的元素和元素对应的索引传递出来
    // obj 就是当前取出的元素，idx 就是当前元素的对应索引
    // stop 用于控制什么时候停止遍历
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 1)
        {
            // 停止遍历
            *stop = YES;
        }
        NSLog(@"idx = %lu, obj = %@", idx, obj);
    }];
    
    return 0;
}
