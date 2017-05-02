//
//  ViewController.m
//  NSOperationQuene 线程间通信
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
    // 创建队列
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    __block UIImage *image1 = nil;
    __block UIImage *image2 = nil;
    
    // 1. 下载图片1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"http://b.hiphotos.baidu.com/baike/w%3D268%3Bg%3D0/sign=92e00c9b8f5494ee8722081f15ce87c3/29381f30e924b899c83ff41c6d061d950a7bf697.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        image1 = [UIImage imageWithData:data];
        NSLog(@"op1 ---- current thread = %@", [NSThread currentThread]); // op1 ---- current thread = <NSThread: 0x61000007bb00>{number = 4, name = (null)}
    }];
    
    
    // 2. 下载图片2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=596812886,3493058479&fm=58"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        image2 = [UIImage imageWithData:data];
        NSLog(@"op2 ---- current thread = %@", [NSThread currentThread]); // op2 ---- current thread = <NSThread: 0x6000000783c0>{number = 5, name = (null)}
    }];
    
    
    // 3. 合成图片
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        
        // 开启图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(300, 300));
        
        // 绘制图片
        [image1 drawInRect:CGRectMake(0, 0, 150, 300)];
        image1 = nil;
        [image2 drawInRect:CGRectMake(150, 0, 150, 300)];
        image2 = nil;
        
        // 获取图片
        UIImage *combineImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // 关闭图形上下文
        UIGraphicsEndImageContext();
        
        NSLog(@"op3 ---- current thread = %@", [NSThread currentThread]); // op3 ---- current thread = <NSThread: 0x608000073d80>{number = 6, name = (null)}
        
        // 回到主线程，渲染 UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = combineImage;
            NSLog(@"mainQueue ---- current thread = %@", [NSThread currentThread]); // mainQueue ---- current thread = <NSThread: 0x61000006ffc0>{number = 1, name = main}
        }];
    }];
    
    // 4. 设置依赖
    [op3 addDependency:op1];
    [op3 addDependency:op2];
    
    // 5. 将操作加入到队列
    [q addOperation:op1];
    [q addOperation:op2];
    [q addOperation:op3];
}


@end
