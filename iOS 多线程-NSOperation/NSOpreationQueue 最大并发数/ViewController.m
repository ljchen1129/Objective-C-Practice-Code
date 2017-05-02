//
//  ViewController.m
//  NSOpreationQueue 最大并发数
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
    // 1. 创建队列
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    // 2. 设置最大并发数
    q.maxConcurrentOperationCount = 1;
    
    // 3. 直接添加任务到队列中
    [q addOperationWithBlock:^{
        NSLog(@"download1------%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.1];
    }];
    
    [q addOperationWithBlock:^{
        NSLog(@"download2------%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.1];
    }];
    
    [q addOperationWithBlock:^{
        NSLog(@"download3------%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.1];
    }];
    
    [q addOperationWithBlock:^{
        NSLog(@"download4------%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.1];
    }];
    
    [q addOperationWithBlock:^{
        NSLog(@"download5------%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.1];
    }];
    
    [q addOperationWithBlock:^{
        NSLog(@"download6------%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.1];
    }];

    [q addOperationWithBlock:^{
        NSLog(@"download7------%@", [NSThread currentThread]);
        [NSThread sleepForTimeInterval:0.1];
    }];
}

@end
