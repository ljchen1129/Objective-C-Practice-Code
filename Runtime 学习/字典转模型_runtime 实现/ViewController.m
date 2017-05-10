//
//  ViewController.m
//  字典转模型_runtime 实现
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+PropertyRuntime.h"
#import "StatusModel.h"
#import "User.h"
#import "PictureModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"status" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    StatusModel *status = [StatusModel modelWithDict:[dict[@"statuses"] lastObject]];
    NSArray *picArr = status.pic_urls;
    for (PictureModel *pic in picArr)
    {
        NSLog(@"pic.thumbnail_pic = %@", pic.thumbnail_pic);
    }
}


@end
