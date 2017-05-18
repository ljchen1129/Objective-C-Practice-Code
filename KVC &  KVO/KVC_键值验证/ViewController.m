//
//  ViewController.m
//  KVC_键值验证
//
//  Created by 陈良静 on 2017/5/18.
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
    
    id value = @"chenliangjing";
    NSError *error;
    
    // 注意：需要手动调用
    BOOL result = [p validateValue:&value forKey:@"name" error:&error];
    if (result)
    {
        NSLog(@"键值匹配");
        [p setValue:value forKey:@"name"];
    }
    else
    {
        NSLog(@"键值不匹配");
        NSLog(@"error = %@", [error localizedDescription]);
    }
    
    NSLog(@"name = %@", [p valueForKey:@"name"]);
    
}

@end
