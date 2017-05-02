//
//  ViewController.m
//  iOS 多线程-NSOperation
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // NSInvocationOperation
//    [self invocationOperation];
    
    // NSBlockOperation
    [self blockOperation];
    
}

// NSBlockOperation 单独使用不会开启线程，但是添加额外的任务情况下会开启新线程，在子线程中执行
- (void)blockOperation
{
    NSLog(@"Current Thread = %@", [NSThread currentThread]); // Current Thread = <NSThread: 0x60800007e5c0>{number = 1, name = main}
    
    // 在主线程执行
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"下载一");
        NSLog(@"Current Thread = %@", [NSThread currentThread]); // Current Thread = <NSThread: 0x60800007e5c0>{number = 1, name = main}
    }];
    
    // 在子线程执行
    [op addExecutionBlock:^{
        NSLog(@"下载二——————Current Thread = %@", [NSThread currentThread]); // 下载二——————Current Thread = <NSThread: 0x610000264e80>{number = 3, name = (null)}
    }];
    
    // 在子线程执行
    [op addExecutionBlock:^{
        NSLog(@"下载三——————Current Thread = %@", [NSThread currentThread]); // 下载三——————Current Thread = <NSThread: 0x618000262dc0>{number = 4, name = (null)}

    }];
    
    // 在子线程执行
    [op addExecutionBlock:^{
        NSLog(@"下载四——————Current Thread = %@", [NSThread currentThread]); // 下载四——————Current Thread = <NSThread: 0x60000007e240>{number = 5, name = (null)}
    }];
    
    // 开启
    [op start];
}

// NSInvocationOperation 对象不会开启线程，任务在主线程执行
- (void)invocationOperation
{
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test:) object:@"chenlianging"];
    NSLog(@"Current Thread = %@", [NSThread currentThread]); // Current Thread = <NSThread: 0x60800006d1c0>{number = 1, name = main}
    
    // 开启
    [op start];
}

- (void)test:(NSString *)prames
{
    NSLog(@"params = %@", prames); // params = chenlianging
    NSLog(@"Current Thread = %@", [NSThread currentThread]); // Current Thread = <NSThread: 0x60800006d1c0>{number = 1, name = main}
}

@end
