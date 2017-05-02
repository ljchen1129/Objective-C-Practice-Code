//
//  main.m
//  数组排序
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {

    NSArray *arr = @[@10, @20, @3, @5, @2, @100];
    
    // 方法一：只能用于 OC 对象
    // compare: 排序方法只能用在数组中所有元素是 OC 对象时才能使用，如果数组中的对象时非 OC 对象，那么程序会运行报错
    NSArray *newArr = [arr sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"newArr = %@", newArr); // newArr = (2, 3, 5, 10, 20, 100)

    // 方法二：可用于自定义对象
    Person *p1 = [Person new];
    p1.age = 35;
    Person *p2 = [Person new];
    p2.age = 15;
    Person *p3 = [Person new];
    p3.age = 45;
    Person *p4 = [Person new];
    p4.age = 5;
    
    NSArray *arr2 = @[p1, p2, p3, p4];
    NSLog(@"arr2.age = %@", arr2);
    
    // 该排序方法默认会按照升序排序
    NSArray *newArr2 = [arr2 sortedArrayUsingComparator:^NSComparisonResult(Person *obj1, Person *obj2) {
        // 每次调用该 block 都会取出数组中的两个元素出来
        // 二分排序
        return obj1.age > obj2.age;
    }];
    NSLog(@"newArr2 = %@", newArr2);
    
    
    return 0;
}
