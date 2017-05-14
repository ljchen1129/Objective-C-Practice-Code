//
//  NSObject+KVO.m
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "NSObject+KVO.h"
#import <objc/message.h>

static NSString *const kObserver = @"kObserver";

@implementation NSObject (KVO)

- (void)clj_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    // 1. 自定义一个继承自观察对象的子类CLJ_KVO_Object
    // 1.1. 动态生成一个类
    NSString *oldClassName = NSStringFromClass([self class]);
    const char *newClassName = [[@"CLJ_KVO_" stringByAppendingString:oldClassName] UTF8String];
    
    // 定义一个类
    // 第一个参数：继承自哪个类
    // 第二个参数：类的名称
    // 第三个参数：
    Class cls = objc_allocateClassPair([self class], newClassName, 0);
    
    // 注册新类
    objc_registerClassPair(cls);
    
    
    // 2. 重写被观察属性的 setter 方法，在内部恢复父类的做法，通知观察者
    // 添加setter方法
    class_addMethod(cls, @selector(setName:), (IMP)setName, "v@:@");
    
    // 3. 修改 self 的 isa 指针，指向子类对象
    object_setClass(self, cls);
    
    // 4. 将观察者保存到当前对象
    // 参数一：要关联的源对象
    // 参数二：key 键值
    // 参数三：关联对象
    // 参数四：关联对象值得内存管理策略
    objc_setAssociatedObject(self, &kObserver, observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

void setName(id self, SEL _cmd, NSString *newName)
{
    NSLog(@"newName = %@", newName);
    
    // 保存当前类型
    id class = [self class];
    
    // 改变 isa 指针
    object_setClass(self, class_getSuperclass(class));
    
    // 调用父类的 set 方法，设置新值
    objc_msgSend(self, @selector(setName:), newName);
    
    
    // 取出观察者对象
    id observer = objc_getAssociatedObject(self, &kObserver);
    
    // 通知观察者
    objc_msgSend(observer, @selector(observeValueForKeyPath:ofObject:change:context:), @"name", self, nil, nil);
    
    // 返回子类类型
    object_setClass(self, class);
}

@end
