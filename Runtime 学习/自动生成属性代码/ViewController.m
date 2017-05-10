//
//  ViewController.m
//  自动生成属性代码
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "StatusModel.h"
#import "NSObject+Property.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *path = [[NSBundle mainBundle] pathForResource:@"status.plist" ofType:nil];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *dic = [dict[@"statuses"] firstObject];
    
    [StatusModel resolveDict:dic];
    
}



@end
