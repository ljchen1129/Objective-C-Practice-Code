//
//  ViewController.m
//  KVC
//
//  Created by 陈良静 on 2017/5/11.
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
//    p->name = @"实例变量：zhangsan";
//    
//    NSString *name = [p valueForKey:@"name"];
//    
//    NSLog(@"name = %@", name);
//    [p setValue:@"zhangsan" forKey:@"name"];
//    [p name];
    
    [p setValue:nil forKey:@"name"];
}




@end
