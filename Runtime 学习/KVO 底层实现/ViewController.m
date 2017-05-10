//
//  ViewController.m
//  KVO 底层实现
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"

@interface ViewController ()

@property(nonatomic, strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    Person *p = [[Person alloc] init];
    
//    [p addObserver:self forKeyPath:@"_name" options:NSKeyValueObservingOptionNew context:nil];
    
    [p clj_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    _p = p;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"对象%@的%@被改变为%@", object, keyPath, change);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _p.name = @"chenliangjing";
}

@end
