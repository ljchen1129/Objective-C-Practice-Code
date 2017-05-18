//
//  Person.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Person : NSObject
{
    NSNumber *height;
    NSString *_name;
    NSUInteger _isAge;
    NSNumber *weight;
}

///
//@property(nonatomic, copy) NSString *name;
//
//@property(nonatomic, assign) double height;
//
//@property(nonatomic, assign) NSUInteger age;

@end
