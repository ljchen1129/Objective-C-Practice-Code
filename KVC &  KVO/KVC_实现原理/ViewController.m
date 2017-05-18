//
//  ViewController.m
//  KVC_实现原理
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVCImplecation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = [Person new];
    [p clj_setValue:@1.70 forKey:@"height"];
    [p clj_setValue:@"26" forKey:@"age"];
    [p clj_setValue:@"chenliangjing" forKey:@"name"];
    [p clj_setValue:nil forKey:@"weight"];
    
    NSLog(@"name = %@", [p clj_valueForKey:@"name"]);
    NSLog(@"height = %@", [p clj_valueForKey:@"height"]);
    NSLog(@"age = %@", [p clj_valueForKey:@"age"]);
}


@end
