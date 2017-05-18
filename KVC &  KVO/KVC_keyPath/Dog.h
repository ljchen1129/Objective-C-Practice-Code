//
//  Dog.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Food;

typedef struct {
    NSUInteger year;
    NSUInteger mouth;
    NSUInteger day;
}DogBirthday;

@interface Dog : NSObject

@property(nonatomic, assign) DogBirthday birthday;

@property(nonatomic, assign) double height;

/// <#annotation#>
@property(nonatomic, strong) Food *food;

@end
