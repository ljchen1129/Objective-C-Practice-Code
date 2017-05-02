//
//  main.m
//  创建
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // 1. 创建一个空的字典
    NSMutableDictionary *mDic = [NSMutableDictionary dictionary];
    NSLog(@"mDic = %@", mDic); // mDic = { }
    
    // 2. 添加
    [mDic setObject:@"chenliangjing" forKey:@"name"];
    NSLog(@"mDic = %@", mDic); // mDic = { name = chenliangjing; }
    
    // 将字典中所有的键值对全部取出来添加到 mDic 中去
    [mDic setValuesForKeysWithDictionary:@{@"age" :  @25, @"height" : @1.70}];
    NSLog(@"mDic = %@", mDic); // mDic = { age = 25; height = "1.7"; name = chenliangjing;}
    
    // 3. 获取
    NSString *name = mDic[@"name"]; // 推荐使用
    NSLog(@"name = %@", name); // name = chenliangjing
    NSNumber *height = [mDic objectForKey:@"height"];
    NSLog(@"height = %@", height); // height = 1.7
    
    // 4. 删除
    // 通过 key 删除
    [mDic removeObjectForKey:@"name"];
    NSLog(@"mDic = %@", mDic); // mDic = { age = 25; height = "1.7"; }
    
    // 通过一个 key 的数组删除
    [mDic removeObjectsForKeys:@[@"height", @"age"]];
    NSLog(@"mDic = %@", mDic); // mDic = { }

    // 5. 修改
    [mDic setObject:@"zhangsan" forKey:@"name"];
    NSLog(@"mDic = %@", mDic); // mDic = { name = zhangsan;}
    
    // 通过 setObject: 给同名的 key 赋值，就可以覆盖掉以前的旧值
    [mDic setObject:@"lisi" forKey:@"name"];
    NSLog(@"mDic = %@", mDic); // mDic = { name = lisi;}
    
    // 通过字面量语法赋值
    mDic[@"name"] = @"wangwu";
    NSLog(@"mDic = %@", mDic); // mDic = { name = wangwu;}
   
    
    
    
    return 0;
}
