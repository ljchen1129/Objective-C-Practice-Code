//
//  ViewController.m
//  字符串创建
//
//  Created by 陈良静 on 2017/4/16.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *str1 = [[NSString alloc] initWithFormat:@"chenliangjing"];
    NSString *str2 = [[NSString alloc] initWithFormat:@"chenliangjing"];
    NSString *str3 = [[NSString alloc] initWithFormat:@"chenliangjing"];
    NSString *str4 = [[NSString alloc] initWithFormat:@"chenliangjing"];
    
//    NSString *str2 = [NSString stringWithFormat:@"chenliangjing"];
    
    NSLog(@"&str1 = %p, &str2 = %p, &str3 = %p, &str4 = %p", str1, str2, str3, str4);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
