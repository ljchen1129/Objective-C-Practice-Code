//
//  Person.m
//  Copy
//
//  Created by 陈良静 on 2017/4/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"%s", __func__);
    [_myBlock release];
    [super dealloc];
}
@end
