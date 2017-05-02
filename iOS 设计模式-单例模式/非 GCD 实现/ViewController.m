//
//  ViewController.m
//  非 GCD 实现
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        Person *p1 = [[Person alloc] init];
        NSLog(@"\np1 = %@", p1);
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        Person *p3 = [Person sharedInstance];
        Person *p4 = [p3 copy];
        NSLog(@"\np3 = %@\np4 = %@", p3, p4);
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        Person *p2 = [[Person allocWithZone:nil] init];
        NSLog(@"\np2 = %@", p2);
    });
}


@end
