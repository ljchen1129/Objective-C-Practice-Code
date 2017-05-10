//
//  ViewController.m
//  GCD
//
//  Created by 陈良静 on 2017/5/9.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/// dispatch_source_t
@property(nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)gcdTimer
{
    // 1. 创建定时器源对象
    // 注意：dispatch_source_t 是一个局部变量，本质是一个 OC 对象，需要用一个强引用
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    
    // 2. 设置定时器间隔时间
    // 第一个参数：源对象
    // 第二个参数：从什么时候开始
    // 第三个参数：间隔时间
    // 第四个参数：传 0
    dispatch_source_set_timer(self.timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0);
    
    // 3. 设置定时器处理事件
    dispatch_source_set_event_handler(self.timer, ^{
        NSLog(@"我是GCD定时器！");
        NSLog(@"current Thread = %@", [NSThread currentThread]);
    });
    
    // 4. 开启定时器
    dispatch_resume(self.timer);
    
}

// 开启定时器
- (IBAction)startTimer:(id)sender
{
    [self gcdTimer];
}

// 取消定时器
- (IBAction)cacelTimer:(id)sender
{
    dispatch_cancel(self.timer);
    self.timer = nil;
}

@end
