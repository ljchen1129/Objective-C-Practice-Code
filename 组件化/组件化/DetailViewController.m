//
//  DetailViewController.m
//  组件化
//
//  Created by 陈良静 on 2017/4/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

+ (UIViewController *)detailViewController:(NSString *)passId
{
    DetailViewController *detailVc = [[DetailViewController alloc] init];
    NSLog(@"detailVc = %@", detailVc);
    return detailVc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.navigationController.title = @"详细";
//    self.view.backgroundColor = [UIColor redColor];
}

- (void)loadView
{
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 550)];
    myView.backgroundColor = [UIColor orangeColor];
    
    self.view = myView;
}


@end
