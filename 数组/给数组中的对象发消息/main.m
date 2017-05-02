//
//  main.m
//  给数组中的对象发消息
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {

    
    Person *p1 = [Person new];
    p1.food = @"food1";
    Person *p2 = [Person new];
    p2.food = @"food2";
    Person *p3 = [Person new];
    p3.food = @"food3";
    Person *p4 = [Person new];
    p4.food = @"food4";
    
    NSArray *arr = @[p1, p2, p3, p4];
    // 如果使用 OC 数组存储对象，可以调用数组的方法给数组中所有的元素都执行指定的方法
    // 注意：如果数组中保存的不是相同类型的元素，并且没有相同的方法，那么程序运行会报错
    [arr makeObjectsPerformSelector:@selector(eatWithFood:) withObject:@"food"];
    
    return 0;
}
