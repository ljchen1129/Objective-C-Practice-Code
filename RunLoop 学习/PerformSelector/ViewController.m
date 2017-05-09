//
//  ViewController.m
//  PerformSelector
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(run) onThread:[NSThread currentThread] withObject:nil waitUntilDone:NO modes:@[]];
}

- (void)run
{
    NSLog(@"run-----");
}

@end
