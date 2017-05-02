//
//  School.m
//  Protocol
//
//  Created by 陈良静 on 2017/4/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "School.h"

@implementation School

- (void)studentStudy
{
    // 每次在调用对象的协议方法时应该进行一次验证
    if ([self.delegate respondsToSelector:@selector(study)])
    {
        [self.delegate study];
    }
    
}

@end
