//
//  ViewController.m
//  字典转模型
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "StatusModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
   StatusModel *model = [StatusModel statusWithDict:dict[@"statuses"][0]];
    
    NSLog(@"%@", model.idst);
}



@end
