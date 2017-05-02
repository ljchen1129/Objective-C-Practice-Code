//
//  OtherViewController.m
//  组件化
//
//  Created by 陈良静 on 2017/4/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

+ (UIViewController *)otherViewController:(NSString *)passId
{
    OtherViewController *otherVc = [[OtherViewController alloc] init];
    return otherVc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
