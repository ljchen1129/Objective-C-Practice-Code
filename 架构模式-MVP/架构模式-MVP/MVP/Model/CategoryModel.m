//
//  CategoryModel.m
//  架构模式-MVP
//
//  Created by 陈良静 on 2017/4/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "CategoryModel.h"
#import "HttpUtils.h"
#import "YYModel.h"

@implementation CategoryModel

// 请求分类列表数据
- (void)requestCategoryDataWithName:(NSString *)name pwd:(NSString *)pwd callBack:(void(^)(id response))callBack
{
    NSLog(@"name = %@, pwd = %@", name, pwd);
    [HttpUtils getRequsetWithUrl:@"http://api.budejie.com/api/api_open.php?a=category&c=subscribe" callBack:^(NSDictionary *dict) {
        NSDictionary *dic = dict[@"list"];
        // 将字典数组转成模型数组
        id response = [NSArray yy_modelArrayWithClass:[self class] json:dic];
        callBack(response);
    }];
}

@end
