//
//  Person.h
//  自定义类实现 Copy
//
//  Created by 陈良静 on 2017/4/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;

@interface Person : NSObject<NSCopying>

@property(nonatomic, strong) Dog *dog;

@property(nonatomic, copy) NSString *name;

@end
