//
//  ViewController.m
//  RunLoop 接口方法
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
    
    
    CFRunLoopRef mainRunLoop = CFRunLoopGetMain();
    NSLog(@"%@", mainRunLoop);
    
//    /// 添加常用 CommonMode
//    // CFRunLoopRef ： RunLoop 实例对象
//    // CFRunLoopMode : mode 名称
//    CFRunLoopAddCommonMode(CFRunLoopRef rl, <#CFRunLoopMode mode#>)
//    
//    /// RunLoop 运行在什么模式中
//    CFRunLoopRunInMode(<#CFRunLoopMode mode#>, <#CFTimeInterval seconds#>, <#Boolean returnAfterSourceHandled#>)
}


@end
