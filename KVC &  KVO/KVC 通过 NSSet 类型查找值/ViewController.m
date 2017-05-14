//
//  ViewController.m
//  KVC 通过 NSSet 类型查找值
//
//  Created by 陈良静 on 2017/5/14.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    Person *p = [Person new];
    
    id value = [p valueForKey:@"name"];
    
    NSLog(@"value = %@", value);
    NSLog(@"class = %@", [value class]);
    
}


@end
