//
//  main.m
//  Block
//
//  Created by 陈良静 on 2017/4/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

//int sum(int a, int b)
//{
//    return a + b;
//}
//
//typedef int (^calculator) (int, int);

//void goWorkPrefix()
//{
//    NSLog(@"起床");
//    NSLog(@"跑步去上班");
//    NSLog(@"打开电脑");
//}
//
//void goWorkSufix()
//{
//    NSLog(@"关闭电脑");
//    NSLog(@"收拾东西");
//    NSLog(@"跑步回家");
//}
//
//void goWork(void (^workBlock)())
//{
//    // 上班前做的事情
//    goWorkPrefix();
//    
//    // 上班中
//    workBlock();
//    
//    // 下班前做的事情
//    goWorkSufix();
//}
//
//void goWorkInDay1()
//{
//    goWork(^{
//        NSLog(@"认识新同事");
//    });
//}
//
//void goWorkInDay2()
//{
//    goWork(^{
//        NSLog(@"熟悉项目");
//    });
//}
//
//void goWorkInDay3()
//{
//    goWork(^{
//        NSLog(@"开发新需求");
//    });
//}
//
//void goWorkInDay4()
//{
//    goWork(^{
//        NSLog(@"项目发布");
//    });
//}


int main(int argc, const char * argv[]) {
    @autoreleasepool {


//        int (* sumP)(int, int);
//        printf("%d" ,sumP(10, 20)); // print 30
        
        // 无参数无返回值 Block
//        void (^block) () = ^{
//            NSLog(@"我是 block");
//        };
//        block(); // 我是 block
        
        
//        // 带有参数 Block 的定义和使用
//        void (^myBlock) (NSString *name, int age) = ^(NSString *name, int age) {
//            NSLog(@"name = %@, age = %d", name, age);
//        };
//        myBlock(@"陈良静", 25); // name = 陈良静, age = 25
        
        
        // 带有参数和返回值的 Block 的定义和使用
//        calculator sumBlock = ^(int a, int b) {
//            NSLog(@"%d", a + b);
//            return a + b;
//        };
//        // 调用 block
//        sumBlock(10, 20); // 30

        
        
//        goWorkInDay1();
//        goWorkInDay2();
//        goWorkInDay3();
//        goWorkInDay4();

        
        
        
        // 1. block 中可以访问外面的变量
//        int a = 10;
//        void (^myBlock)() = ^{
//            NSLog(@"%i", a);
//        };
//        myBlock(); // 10
        
        
        // 2. block 中可以定义和外界同名的变量
//        int a = 10;
//        void (^myBlock)() = ^{
//            int a = 20;
//            NSLog(@"%i", a);
//        };
//        myBlock(); // 20
        
        
//        // 3. 默认情况下，不可以在 block 中修改外界变量的值
//        
//        int a = 10;
//        void (^myBlock)() = ^{
//            NSLog(@"a = %i", a);
//        };
//        // 在 block 调用之前，在外面修改变量的值不会影响到 block 中变量的值
//        a = 20;
//        myBlock(); // 10

        
//        // 4. 在 block 中修改外界变量的值
//        __block int a = 10;
//        void (^myBlock)() = ^{
//            a = 20;
//            NSLog(@"a = %i", a);
//        };
//        myBlock(); // 20
//        NSLog(@"a = %i", a); // 20
//
        
        
        // block 存储在堆中还是栈中？
        // 1. 默认情况下， block 在栈中
//        Person *p = [[Person alloc] init];
//        NSLog(@"refrence Count = %lu", [p retainCount]); // refrence Count = 1
//        void (^myBlock)() = ^{
//            NSLog(@"refrence Count = %lu", [p retainCount]);
//        };
//        myBlock(); // refrence Count = 1
//        [p release];
        
        
        // 2. 如果对 block 进行一个 `copy 操作，block 会转移到`堆`中
//        Person *p = [[Person alloc] init];
//        NSLog(@"refrence Count = %lu", [p retainCount]); // refrence Count = 1
//        void (^myBlock)() = ^{
//            NSLog(@"refrence Count = %lu", [p retainCount]);
//        };
//        // 将 block 拷贝到堆中
//        Block_copy(myBlock);
//        myBlock(); // refrence Count = 2
//        [p release];

        // 2. 给对象加上 __block 关键字
//        __block Person *p = [[Person alloc] init];
//        NSLog(@"refrence Count = %lu", [p retainCount]); // refrence Count = 1
//        void (^myBlock)() = ^{
//            NSLog(@"refrence Count = %lu", [p retainCount]);
//        };
//        // 将 block 拷贝到堆中
//        Block_copy(myBlock);
//        myBlock(); // refrence Count = 2
//        [p release];


        void(^blcok)(int) = ^(int a) {
            NSLog(@"˜a = %d", a);
        };
        blcok(12);
        
    }
    
    return 0;
}
