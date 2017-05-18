//
//  Dog.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Dog.h"
#import "Food.h"

@implementation Dog

- (instancetype)init
{
    self = [super init];
    if (self) {
        DogBirthday b = {2017, 5, 15};
        _birthday = b;
        _height = 1.30;
        _food = [Food new];
    }
    return self;
}
@end
