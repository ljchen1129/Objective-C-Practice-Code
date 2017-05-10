//
//  ViewController.m
//  RunLoop 学习
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
   
    [self defaultRunLoopMode];
    
 }

// 定时器工作在指定 RunLoop 模式下
- (void)setUpRunLoopMode
{
    // 1. 定时器会运行在标记的特定 RunLoop 模式下. 一旦进入其他模式，定时器就不会工作.
    NSTimer *timer = [NSTimer timerWithTimeInterval:0.5 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    // 如果不在 NSDefaultRunLoopMode 模式下，在其他模式下，定时器就不会工作
    //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    // 定时器会运行在标记为 CommonModes 的模式下
    // 标记为 CommonModes 的模式：UITrackingRunLoopMode 和 NSDefaultRunLoopMode
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

// 定时器在默认 RunLoop 模式下
- (void)defaultRunLoopMode
{
    // 2. 定时器工作在默认模式下，默认是 NSDefaultRunLoopMode 模式
    [NSTimer scheduledTimerWithTimeInterval:0.5 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"我是定时器！");
        NSLog(@"runloop = %@", [NSRunLoop currentRunLoop]);
    }];
}

- (void)run
{
    NSLog(@"run---");
}

@end
