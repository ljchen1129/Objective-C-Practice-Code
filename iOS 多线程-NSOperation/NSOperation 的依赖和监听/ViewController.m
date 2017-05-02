//
//  ViewController.m
//  NSOperation 的依赖和监听
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1. 创建队列
    NSOperationQueue *q1 = [[NSOperationQueue alloc] init];
    NSOperationQueue *q2 = [[NSOperationQueue alloc] init];
    
    // 2. 创建操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download1------%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download2------%@", [NSThread currentThread]);
    }];

    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download3------%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 10; i ++)
        {
            NSLog(@"download4------%@", [NSThread currentThread]);
        }
    }];
    
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download5------%@", [NSThread currentThread]);
    }];
    
    // 3. 设置依赖
    [op3 addDependency:op1]; // op1 执行完了才能执行 op3
    [op1 addDependency:op3];
    [op3 addDependency:op2]; // op2 执行完了才能执行 op3
    [op3 addDependency:op4]; // op4 执行完了才能执行 op3
    
    // 4. 将操作加入到队列中
    [q1 addOperation:op1];
    [q1 addOperation:op2];
    [q1 addOperation:op3];
    [q2 addOperation:op4];
    [q2 addOperation:op5];
    
    // 监听操作的执行完毕
    op5.completionBlock = ^{
        NSLog(@"op5 执行完毕%@", [NSThread currentThread]); // 在子线程中执行，但不一定是和操作在同一一个子线程
    };
}

@end
