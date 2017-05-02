//
//  ViewController.m
//  NSOpreationQueue 的挂起和取消
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) NSOperationQueue *queue;

/// <#annotation#>
@property(nonatomic, strong) NSBlockOperation *op;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1. 创建队列
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    // 2. 设置最大并发数
    q.maxConcurrentOperationCount = 2;
    
    // 3. 直接添加任务到队列中
    [q addOperationWithBlock:^{
        for (int i = 0; i < 1000; i ++)
        {
            NSLog(@"download1------%@", [NSThread currentThread]);
        }
    }];
    
    [q addOperationWithBlock:^{
        for (int i = 0; i < 1000; i ++)
        {
            NSLog(@"download2------%@", [NSThread currentThread]);
        }
    }];
    
    [q addOperationWithBlock:^{
        for (int i = 0; i < 1000; i ++)
        {
            NSLog(@"download3------%@", [NSThread currentThread]);
        }
    }];
    
    [q addOperationWithBlock:^{
        NSLog(@"download4------%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:1];
    }];
    
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        for (int i = 0; i < 100; i ++)
        {
            NSLog(@"op1----");
            [op cancel];
        }
        
    }];
    
    [op addExecutionBlock:^{
        NSLog(@"op2----");
    }];
    
    [op addExecutionBlock:^{
         NSLog(@"op3----");
    }];
    
    [q addOperation:op];
    
    self.queue = q;
    self.op = op;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    if (self.queue.suspended)
//    {
//        // 恢复暂停
//        self.queue.suspended = NO;
//    }
//    else
//    {
//        // 任务挂起，暂停执行
//        self.queue.suspended = YES;
//    }
    
    // 取消所有操作
//    [self.queue cancelAllOperations];
    
    // 取消某一个操作
    [self.op cancel];
}

@end
