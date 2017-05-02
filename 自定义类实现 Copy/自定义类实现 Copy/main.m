//
//  main.m
//  自定义类实现 Copy
//
//  Created by 陈良静 on 2017/4/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
#import "Student.h"

int main(int argc, const char * argv[]) {

    // 无父类实现
//    Person *p1 = [Person new];
//    p1.name = @"zhangsan";
//    
//    // copy
//    Person *p2 = [p1 copy];
//    NSLog(@"p2.name = %@", p2.name); // p2.name = zhangsan
    
    // 有父类实现
    Student *stu1 = [Student new];
    stu1.name = @"张三";
    stu1.height = 170.0;
    // copy
    Student *stu2 = [stu1 copy];
    NSLog(@"stu2.name = %@, stu2.height = %f", stu2.name, stu2.height);
    
    return 0;
}
