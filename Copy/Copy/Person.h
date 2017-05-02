//
//  Person.h
//  Copy
//
//  Created by 陈良静 on 2017/4/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic, copy) NSString *name;

// 注意：如果是 block 使用 copy 并不是拷贝，而是转移，将栈中的 block 转移到 堆中去
@property(nonatomic, copy) void (^myBlock)();

@end
