//
//  Person.h
//  Protocol
//
//  Created by 陈良静 on 2017/4/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;

@protocol PersonProtocol <NSObject>

- (void)personFindHourse:(Person *)person;

@end

@interface Person : NSObject

/// 代理
@property(nonatomic, strong) id<PersonProtocol> delegate;

- (void)findHourse;

@end
