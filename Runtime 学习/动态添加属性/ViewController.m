//
//  ViewController.m
//  动态添加属性
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *p = [[Person alloc] init];
    p.name = @"chenliangjing";
    
    NSLog(@"name = %@", p.name);
}

@end
