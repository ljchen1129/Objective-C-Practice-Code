//
//  Person.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dog = [Dog new];
    }
    
    return self;
}

@end
