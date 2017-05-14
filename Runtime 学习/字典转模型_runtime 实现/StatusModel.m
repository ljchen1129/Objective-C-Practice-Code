//
//  StatusModel.m
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "StatusModel.h"
#import "PictureModel.h"

@implementation StatusModel

+ (NSDictionary *)arrayContainModelClass
{
    return @{@"pic_urls" : [PictureModel class]};
}

@end
