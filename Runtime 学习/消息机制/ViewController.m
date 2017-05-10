//
//  ViewController.m
//  消息机制
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    Person *p = [[Person alloc] init];
    // 消息发送机制：类是一个特殊的对象：OC 类对象
    // 1. 获取一个类对象
    id cls = objc_getClass("Person");
    
    // 2. 注册 C 函数
    SEL alloc = sel_registerName("alloc");
    
    // 3. 给类对象发送消息
    // 参数一：消息接受者
    // 参数二：消息的实现方法
    // 参数三：方法的参数
    Person *p = objc_msgSend(cls, alloc);
    
    // 4. 给实例对象发送消息
    // 4.1. 注册一个 C 函数
    SEL init = sel_registerName("init");
    p = objc_msgSend(p, init);
    
    // 上面代码等价于这句
//    Person *p = objc_msgSend(objc_msgSend(objc_getClass("Person"), sel_registerName("alloc")), sel_registerName("init"));
    
    // 5. 给实例对象发送消息
    // 5.1 创建一个 C 函数
    SEL eat = sel_registerName("eat");
    objc_msgSend(p, eat);
}


@end
