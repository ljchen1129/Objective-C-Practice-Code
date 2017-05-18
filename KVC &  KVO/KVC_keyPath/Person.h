//
//  Person.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;

@interface Person : NSObject

///
@property(nonatomic, copy) NSString *name;

///
@property(nonatomic, strong) Dog *dog;

@end


