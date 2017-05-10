//
//  ViewController.m
//  GCD 实现定时器
//
//  Created by 陈良静 on 2017/5/9.
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
    [self OCTimerInBackgroudThread];
}


// 在主线程中实现定时器
- (void)OCTimerInMainThread
{
    // 1.
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"我是OCTimer");
    }];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    // 2.
//    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"我也是OCTimer");
//    }];
}

// 在子线程中实现定时器
- (void)OCTimerInBackgroudThread
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
//        // 1. 
//        [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
//            NSLog(@"我是OCTimerInBackgroudThread");
//        }];
//        
//        // 启动子线程 RunLoop
//        [[NSRunLoop currentRunLoop] run];
        
        // 2.
        NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"我是OCTimerInBackgroudThread");
        }];
        
        // 将 timer 加入到当前子线程 RunLoop
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        
        // 启动子线程 RunLoop
        [[NSRunLoop currentRunLoop] run];
        
        NSLog(@"我是子线程 = %@", [NSThread currentThread]);
    });
}

@end
