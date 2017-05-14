//
//  Student.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/14.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Person.h"

@interface Student : Person

///
@property(nonatomic, strong) NSMutableArray *friends;

/// 
@property(nonatomic, strong) NSMutableSet *foodSet;


- (instancetype)initWithKeyPath:(NSString *)keyPath target:(id)target selector:(SEL)sel options:(NSKeyValueObservingOptions)options;

@end
