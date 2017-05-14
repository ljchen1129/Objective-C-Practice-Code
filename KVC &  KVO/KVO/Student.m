//
//  Student.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/14.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "Student.h"

static int const PrivateKVOContext;

@interface Student ()

@property(nonatomic, strong) id target;
@property(nonatomic, assign) SEL sel;
@property (nonatomic, copy) NSString *keyPath;

@end

@implementation Student

- (instancetype)initWithKeyPath:(NSString *)keyPath target:(id)target selector:(SEL)sel options:(NSKeyValueObservingOptions)options
{
    NSParameterAssert(target != nil);
    NSParameterAssert([target respondsToSelector:sel]);

    self = [super init];
    if (self) {
        _foodSet = [NSMutableSet setWithObject:@"zhangsan"];
        _friends = [NSMutableArray arrayWithObject:@"zhangsan"];
        
        self.target = target;
        self.sel = sel;
        self.keyPath = keyPath;
        
        [self addObserver:self forKeyPath:keyPath options:options context:&PrivateKVOContext];
    }
    return self;
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:self.keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == &PrivateKVOContext) {
        [self didChange:change];
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)didChange:(NSDictionary *)change
{
    id strongTarget = self.target;
    
    // 消除警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [strongTarget performSelector:self.sel withObject:change];
#pragma clang diagnostic pop
}

@end
