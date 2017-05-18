//
//  Person.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Dog;

@interface Person : NSObject

///
@property(nonatomic, strong) NSString *name;
@property (nonatomic, assign) CGFloat height;
///
@property(nonatomic, strong) NSDate *date;

/// 狗
@property(nonatomic, strong) Dog *dog;

@end
