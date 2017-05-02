//
//  ViewController.m
//  NSOperationQueue
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
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    // GCD 队列类型
    // 并发队列：自己创建的、全局并发队列
    // 串行队列：自己创建的、主队列
    
    // NSOpreation 队列类型
    // 主队列：[NSOperationQueue mainQueue]。凡是添加到主队列中的任务，都会放到主线程中执行
    // 其他队列：(串行、并发) [[NSOperationQueue alloc] init]。添加到这种队列中的任务，会自动在子线程中执行。
    
    // 1. 创建队列
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    // 2. 创建操作
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download1) object:nil];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download2) object:nil];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download3----%@", [NSThread currentThread]);
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"download4----%@", [NSThread currentThread]);
    }];
    
    [op4 addExecutionBlock:^{
        NSLog(@"download5----%@", [NSThread currentThread]);
    }];

    // 3. 将任务添加到队列中
    [q addOperation:op1];
    [q addOperation:op2];
    
    [op3 start];
    [op4 start];
}

- (void)download1
{
    NSLog(@"download1----%@", [NSThread currentThread]); // download1----<NSThread: 0x61000006ffc0>{number = 3, name = (null)}
}

- (void)download2
{
    NSLog(@"download2----%@", [NSThread currentThread]); // download2----<NSThread: 0x600000071380>{number = 4, name = (null)}
}

@end
