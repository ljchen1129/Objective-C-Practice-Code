//
//  CategoryModel.h
//  架构模式-MVP
//
//  Created by 陈良静 on 2017/4/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *id;

@property(nonatomic, assign) NSInteger count;

// 请求分类数据
- (void)requestCategoryDataWithName:(NSString *)name pwd:(NSString *)pwd callBack:(void(^)(id response))callBack;

@end
