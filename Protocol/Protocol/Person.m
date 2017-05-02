//
//  Person.m
//  Protocol
//
//  Created by 陈良静 on 2017/4/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)findHourse
{
    if ([self.delegate respondsToSelector:@selector(personFindHourse:)])
    {
        [self.delegate personFindHourse:self];
    }
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    [super dealloc];
}

@end
