//
//  main.m
//  基本用法
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // 1. 创建一个空数组
    NSMutableArray *arrM = [NSMutableArray array];
    NSLog(@"arrM = %@", arrM); // arrM = ( )
    
    // 2. 添加元素
    [arrM addObject:@"zhangsan"];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan)
    // 从指定数组中取出元素添加到 arrM 中
    [arrM addObjectsFromArray:@[@"lisi", @"wangwu"]];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan, lisi, wangwu)
    
    // 把指定数组当做 arrM 中的一个元素添加
    [arrM addObject:@[@"lisi2", @"wangwu2"]];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan, lisi, wangwu, (lisi2, wangwu2))
    
    // 3. 插入元素
    // 往指定位置插入新元素
    [arrM insertObject:@"chenliangjing" atIndex:2];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan, lisi, chenliangjing, wangwu, (lisi2, wangwu2))
    
    // 插入一组数据，指定数组需要插入的位置，和要插入多少个元素
    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 2)];
    [arrM insertObjects:@[@"A", @"B"] atIndexes:set];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan, lisi, A, B, chenliangjing, wangwu, (lisi2, wangwu2))
    
    // 4. 删除元素
    // 删除最后一个元素
    [arrM removeLastObject];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan, lisi, A, B, chenliangjing, wangwu)
    
    // 从指定位置删除元素
    [arrM removeObjectAtIndex:4];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan, lisi, A, B, wangwu)
    
    // 从指定的范围删除一个数组
    NSIndexSet *remSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(2, 2)];
    [arrM removeObjectsAtIndexes:remSet];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan, lisi, wangwu)
    
    // 删除指定的元素
    [arrM removeObject:@"wangwu"];
    NSLog(@"arrM = %@", arrM); // arrM = (zhangsan, lisi)
    
    // 删除所有元素
    [arrM removeAllObjects];
    NSLog(@"arrM = %@", arrM); // arrM = ( )
    
    // 5. 替换元素
    [arrM addObject:@"A"];
    [arrM replaceObjectAtIndex:0 withObject:@"B"];
    NSLog(@"arrM = %@", arrM); // // arrM = ( B )
    
    // 6. 获取元素
    NSString *element = [arrM objectAtIndex:0];
    NSLog(@"element = %@", element); // element = B
    
    // 7. 简易用法
    // 获取
    NSString *element2 = arrM[0];
    NSLog(@"element2 = %@", element2); // element2 = B
    
    // 替换
    arrM[0] = @"C";
    NSLog(@"arrM[0] = %@", arrM[0]); // arrM[0] = C
    
    
    return 0;
}
