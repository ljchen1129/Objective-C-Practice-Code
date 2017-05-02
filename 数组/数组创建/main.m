//
//  main.m
//  数组创建
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    
//    // 1. 创建方式，创建一个空数组
//    NSArray *arr1 = [[NSArray alloc] init];
//    
//    // 2. 类工厂方法
//    NSArray *arr2 = [NSArray arrayWithObject:@"obj"];
//    NSLog(@"arr2 = %@", arr2);
//    // nil 标识数组的结束符，表示数据添加完毕
//    NSArray *arr3 = [NSArray arrayWithObjects:@"obj1", @"obj2", @"obj3", nil];
//    NSLog(@"arr3 = %@", arr3);
//    NSArray *arr4 = [NSArray arrayWithObjects:@"obj1", @"obj2",nil,  @"obj3", nil];
//    NSLog(@"arr4 = %@", arr4); // arr4 = (obj1,obj2)
    
    
    NSArray *arr = @[@"obj1", @"obj2"];
    
    // 1. 获取数组中元素的个数
    NSUInteger arrCount = [arr count];
    NSLog(@"arrCount = %lu", arrCount); //  arrCount = 2
    
    // 2. 获取最后一个元素
    NSString *lastObj = [arr lastObject];
    NSLog(@"lastObj = %@", lastObj); // lastObj = obj2
    
    // 3. 获取第一个元素
    NSString *firstObj = [arr firstObject];
    NSLog(@"firstObj = %@", firstObj); // firstObj = obj1
    
    // 4. 获取数组中指定位置的元素
    NSString *obj = [arr objectAtIndex:1];
    NSLog(@"obj[1] = %@", obj); // obj[1] = obj2
    
    // 5. 数组中是否包含某一个元素
    NSString *obj3 = @"obj3";
    BOOL flag = [arr containsObject:obj3];
    if (flag)
    {
        NSLog(@"arr 中包含 %@", obj3);
    }
    else
    {
        NSLog(@"arr 中不包含 %@", obj3); // arr 中不包含 obj3
    }
    
    
    // 1. 数组简写
    NSArray *simpleArr = @[@"zhangsan", @"lisi", @"wangwu", @15, @"30"];
    
    // 2. 获取指定位置的数组中元素
    id o = simpleArr[3];
    NSLog(@"o = %@", o); // o = 15
    

    return 0;
}
