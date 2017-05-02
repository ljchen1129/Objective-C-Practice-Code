//
//  main.m
//  字典遍历
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    NSDictionary *dic = @{@"name" : @"chenliangjing", @"age" : @25, @"height" : @1.70};

    // 迭代器
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"key = %@, obj = %@", key, obj);
    }];
    
    
    return 0;
}
