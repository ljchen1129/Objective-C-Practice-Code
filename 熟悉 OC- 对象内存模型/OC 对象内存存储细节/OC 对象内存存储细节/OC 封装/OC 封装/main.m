//
//  main.m
//  OC 封装
//
//  Created by 陈良静 on 2017/4/7.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  Person : NSObject

@property int age;

// 对象方法
- (void)instanceMethod;

// 类方法
+ (void)classMethod;

@end

@implementation Person

// 对象方法
- (void)instanceMethod
{
    NSLog(@"instanceMethod");
}

// 类方法
+ (void)classMethod
{
    NSLog(@"classMethod");
}


// 只要程序启动就会将类的代码加载到内存中，放到代码区
// load 方法会在当前类被加载到内存的时候调用，有且仅会调用一次
+ (void)load
{
    
}

// 当前类第一次被使用时调用（创建类对象的时候）
// initialize 方法在整个程序运行过程中只会调用一次，无论使用多少次真个类都只会调用一次
+ (void)initialize
{
    
}


- (void)dealloc
{
    NSLog(@"Person 被释放了");
    
    [super dealloc];
}

@end

//int main(int argc, const char * argv[]) {
//  
//    Person *p = [[Person alloc] init];
//    
//    // 获取类对象
//    // 1. 通过实例获取
//    Class c1 = [p class];
//    // 2. 通过类对象获取
//    Class c2 = [Person class];
//    NSLog(@"c1 = %p, c2 = %p", c1, c2); //  c1 = 0x100001260, c2 = 0x100001260
//    
//    // 类对象应用场景
//    // 1. 用于创建实例对象
//    Person *p2 = [[c1 alloc] init];
//    p2.age = 25;
//    NSLog(@"%i", p2.age); // 25
//    // 2. 用于调用类方法
//    [c1 classMethod]; // classMethod
//    
//    return 0;
//}

int main(int argc, const char * argv[]) {
 
    @autoreleasepool {
        int a = 10; // 局部变量：栈
        int b = 10; // 局部变量：栈
        
        // p（局部变量） ：栈
        // Person 对象（计数器 = 1）：堆
        Person *p = [[Person alloc] init];
        [p release];
        [p instanceMethod];
    }
    // 出了 } 号，栈里面的变量 a/b/p 都会被回收
    // 但是堆里面的 Person 对象还会留在内存中，因为他的计数器依然是 1
    
    return 0;
}

