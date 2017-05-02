//
//  CategoryPresenter.m
//  架构模式-MVP
//
//  Created by 陈良静 on 2017/4/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "CategoryPresenter.h"
#import "CategoryModel.h"

@interface CategoryPresenter ()

@property(nonatomic, strong) CategoryModel *categoryM;
@property(nonatomic, weak) id<CategroyTableViewDelegate> categoryT;

@end

@implementation CategoryPresenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _categoryM = [[CategoryModel alloc] init];
    }
    
    return self;
}

// 绑定view
- (void)attachView:(id<CategroyTableViewDelegate>)categoryTableView
{
    _categoryT = categoryTableView;
}

// 解除绑定View
- (void)detachView
{
    _categoryT = nil;
}

- (void)categoryTableViewRequestDataWithName:(NSString *)name pwd:(NSString *)pwd
{
    [_categoryM requestCategoryDataWithName:name pwd:pwd callBack:^(id response) {
        if (_categoryT != nil && [_categoryT respondsToSelector:@selector(onCategroyTableViewResult:)])
        {
            [_categoryT onCategroyTableViewResult:response];
        }
    }];
}

@end
