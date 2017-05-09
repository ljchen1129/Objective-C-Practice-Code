//
//  ViewController.m
//  NSNotification 学习
//
//  Created by 陈良静 on 2017/5/5.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"kNotificationName" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notification:) name:@"kAsycNotificaitonName" object:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    NSLog(@"post notification start!");
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationName" object:@"params"];
//    NSLog(@"post notification end!");
    
    // 1. 在子线程执行通知
//    [NSThread detachNewThreadWithBlock:^{
//        NSLog(@"post notification start!");
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotificationName" object:@"params"];
//        NSLog(@"post notification end!");
//    }];
    
    // 2. 异步执行通知
//    [self asychNotification];
    
    
    // 3.在子线程里面异步发送通知
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self asychNotification];
    });
}

// 异步通知
- (void)asychNotification
{
    NSNotification *note = [NSNotification notificationWithName:@"kAsycNotificaitonName" object:@"异步通知，我是参数"];
    
    NSNotificationQueue *q = [NSNotificationQueue defaultQueue];
    NSLog(@"post notification start!");
    [q enqueueNotification:note postingStyle:NSPostWhenIdle coalesceMask:NSNotificationCoalescingOnName forModes:@[NSRunLoopCommonModes]];
    NSLog(@"post notification end!");
    
    // 启动子线程 runloop
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSRunLoopCommonModes];
    [[NSRunLoop currentRunLoop] run];
    
}

- (void)notification:(NSNotification *)note
{
    NSString *param = (NSString *)note.object;
    NSLog(@"current thread = %@", [NSThread currentThread]);
    NSLog(@"param = %@", param);
}




// 通知的特点
// 结论一：通知默认同步执行的
// 结论二：当前发送通知的线程在那条线程，通知执行就会在那条线程。

// 怎么让通知异步执行？
// 通过通知队列
//




@end
