//
//  Dog.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dogName = @"小黑";
    }
    return self;
}
@end
