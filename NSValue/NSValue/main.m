//
//  main.m
//  NSValue
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
 
    // 1. 包装常用结构体
    CGPoint point = CGPointMake(10.0, 20.0);
    NSValue *valueP = [NSValue valueWithPoint:point];
    NSArray *arr = @[valueP];
    NSLog(@"arr = %@", arr); // arr = ("NSPoint: {10, 20}")

    
    // 2. 包装自定义结构体
    typedef struct{
        int age;
        char *name;
        double _height;
    }Person;
    
    Person p = {25, "chenliangjing", 17.0};
    // valueWithBytes: 接收一个指针，需要传递需要包装的结构体的变量的地址
    // objCType: 需要传递需要包装的数据类型
    NSValue *value = [NSValue valueWithBytes:&p objCType:@encode(Person)];
    NSArray *arrV = @[value];
    NSLog(@"arrV = %@", arrV); // rrV = ("<19000000 00000000 740f0000 01000000 00000000 00003140>")

    
    // 从 value 中取出自定义的结构体变量
    Person result;
    [value getValue:&result];
    NSLog(@"age = %d, name = %s, _height = %f", result.age, result.name, result._height); // age = 25, name = chenliangjing, _height = 17.000000
    
    return 0;
}
