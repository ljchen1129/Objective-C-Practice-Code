//
//  KeyValueObserver.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/14.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "KeyValueObserver.h"

@interface KeyValueObserver ()

@property(nonatomic, strong) id target;
@property(nonatomic, assign) SEL sel;
@property (nonatomic, strong) id observeObject;
@property (nonatomic, copy) NSString *keyPath;

@end

@implementation KeyValueObserver

- (instancetype)initWithObject:(NSObject *)object forKeyPath:(NSString *)keyPath target:(id)target selector:(SEL)sel options:(NSKeyValueObservingOptions)options
{
    if (object == nil)
    {
        return nil;
    }
    
    NSParameterAssert(target != nil);
    NSParameterAssert([target respondsToSelector:sel]);
    
    self = [super init];
    if (self)
    {
        self.target = target;
        self.sel = sel;
        self.observeObject = object;
        self.keyPath = keyPath;
        
        [object addObserver:self forKeyPath:keyPath options:options context:(__bridge void *)(self)];
    }
    
    return self;
}

+ (NSObject *)observeObject:(NSObject *)object forKeyPath:(NSString *)keyPath target:(id)target selector:(SEL)sel
{
    return [self observeObject:object forKeyPath:keyPath target:target selector:sel options:0];
}

+ (NSObject *)observeObject:(NSObject *)object forKeyPath:(NSString *)keyPath target:(id)target selector:(SEL)sel options:(NSKeyValueObservingOptions)options
{
    return [[self alloc] initWithObject:object forKeyPath:keyPath target:target selector:sel options:options];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == (__bridge void * _Nullable)(self))
    {
        [self didChange:change];
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

- (void)dealloc
{
    [self.observeObject removeObserver:self forKeyPath:self.keyPath];
}

@end
