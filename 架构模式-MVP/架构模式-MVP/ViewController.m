//
//  ViewController.m
//  架构模式-MVP
//
//  Created by 陈良静 on 2017/4/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

/*
MVP 架构模式
M：数据层（网络、数据库、文件等）数据相关
V：UIView 以及子类 + UIViewController 及子类
P：中介（用于关联 M 和 V）
 
特点：将数据层和 UI 层完全隔离
V 层：只负责创建 UI 和显示 UI，刷新 UI.
*/



#import "ViewController.h"
#import "CategroyTableViewDelegate.h"
#import "CategoryPresenter.h"
#import "CategroyTableView.h"


@interface ViewController () <CategroyTableViewDelegate>

@property (nonatomic, strong) CategoryPresenter *catePresenter;
@property (weak, nonatomic) IBOutlet CategroyTableView *categoryTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _catePresenter = [[CategoryPresenter alloc] init];
    
    // 绑定 P
    [_catePresenter attachView:self];
    
    // 发起数据请求
    [_catePresenter categoryTableViewRequestDataWithName:@"chenlaingjing" pwd:@"123456"];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // 解除绑定
    [_catePresenter detachView];
}

#pragma mark - CategroyTableViewDelegate

- (void)onCategroyTableViewResult:(id)result
{
    NSLog(@"result = %@", result);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.categoryTableView.dataArray = (NSArray *)result;
    });
}


@end
