//
//  ViewController.m
//  创建常驻线程
//
//  Created by 陈良静 on 2017/5/9.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "CustomThread.h"

@interface ViewController ()

@property(nonatomic, strong) CustomThread *thread;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.thread = [[CustomThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [self.thread start];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self creatForeverThread];
}

- (void)creatForeverThread
{
    [self performSelector:@selector(run) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void)run
{
    NSLog(@"run-----");
    NSLog(@"current Thread = %@", [NSThread currentThread]);
    
    // 给子线程添加 Run Loop，任务结束后不让子线程销毁
    [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
}

@end
