//
//  CategoryPresenter.h
//  架构模式-MVP
//
//  Created by 陈良静 on 2017/4/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CategroyTableViewDelegate.h"

@interface CategoryPresenter : NSObject

// 绑定view
- (void)attachView:(id<CategroyTableViewDelegate>)categoryTableView;

// 解除绑定View
- (void)detachView;

- (void)categoryTableViewRequestDataWithName:(NSString *)name pwd:(NSString *)pwd;

@end
