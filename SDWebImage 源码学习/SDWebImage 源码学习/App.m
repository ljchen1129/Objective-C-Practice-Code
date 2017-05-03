//
//  App.m
//  iOS 多线程-NSOperation
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "App.h"

@implementation App

+ (instancetype)appsWithDictionary:(NSDictionary *)dict
{
    App *a = [[App alloc] init];
    [a setValuesForKeysWithDictionary:dict];
    return a;
}

@end
