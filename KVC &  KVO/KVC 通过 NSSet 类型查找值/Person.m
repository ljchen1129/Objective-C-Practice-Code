//
//  Person.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/14.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"

@implementation Person

// countOf<Key>
- (NSUInteger)countOfName
{
    NSLog(@"%s", __func__);
    return 2;
}

// enumeratorOf<Key>
- (NSEnumerator<id> *)enumeratorOfName:(NSSet *)name;
{
    NSEnumerator *enumerator = [name objectEnumerator];
    id value;
    
    while ((value = [enumerator nextObject]))
    {
        value = @"zhangsan";
    }
    
    return enumerator;
}

// memberOf<Key>:
- (nullable id)memberOfName:(id)object
{
    return @"chenliangjing";
}

@end
