//
//  ViewController.m
//  自定义 Opreation
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "CustomOpreation.h"

@interface ViewController ()
/// <#annotation#>
@property(nonatomic, strong) NSOperationQueue *q;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 创建队列
    NSOperationQueue *q = [[NSOperationQueue alloc] init];
    
    // 2. 创建任务
    CustomOpreation *customOp = [[CustomOpreation alloc] init];
    
    // 3. 将任务添加到队列中
    [q addOperation:customOp];
    
    self.q = q;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.q cancelAllOperations];
}


@end
