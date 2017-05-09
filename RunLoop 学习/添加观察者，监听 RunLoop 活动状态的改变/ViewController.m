//
//  ViewController.m
//  添加观察者，监听 RunLoop 活动状态的改变
//
//  Created by 陈良静 on 2017/5/9.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // 1. 创建观察者
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"activity = %lu", activity);
    });
    
    // 2. 添加观察者，监听 RunLoop 状态的改变
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopCommonModes);
    
    // 3. 释放 observer
    CFRelease(observer);
}



@end
