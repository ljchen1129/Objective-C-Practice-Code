//
//  Person.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;

@interface Person : NSObject

/// <#annotation#>
@property(nonatomic, copy) NSString *name;
/// <#annotation#>
@property(nonatomic, strong) Dog *dog;

///
@property(nonatomic, assign) NSUInteger age;

@end
