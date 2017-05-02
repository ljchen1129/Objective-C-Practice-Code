//
//  ViewController.m
//  iOS 设计模式-单例模式
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController () 

@end

@implementation ViewController

SingletonM(ViewController);

- (void)viewDidLoad {
    [super viewDidLoad];
 
    Person *p1 = [[Person alloc] init];
    p1.name = @"chenlj";
    Person *p2 = [[Person alloc] init];
    Person *p3 = [[Person alloc] init];
    Person *p4 = [[Person allocWithZone:nil] init];
    
    NSLog(@"p1 = %p, p2 = %p,p3 = %p, p4 = %p", [Person sharedPerson], [Person sharedPerson], p3, [p4 copy]);
    NSLog(@"%@ %@", [ViewController sharedViewController], [[ViewController alloc] init]);
}



@end
