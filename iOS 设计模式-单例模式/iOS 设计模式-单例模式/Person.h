//
//  Person.h
//  iOS 设计模式-单例模式
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface Person : NSObject
///
@property(nonatomic, copy) NSString *name;

SingletonH(Person);

@end
