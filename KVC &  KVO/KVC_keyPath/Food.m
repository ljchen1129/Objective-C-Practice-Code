//
//  Food.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Food.h"

@implementation Food

- (instancetype)init
{
    self = [super init];
    if (self) {
        _foodName = @"狗粮";
    }
    return self;
}
@end
