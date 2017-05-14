//
//  ViewController.m
//  KVO
//
//  Created by 陈良静 on 2017/5/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"

@interface ViewController ()

@property (nonatomic, strong) Person *p;
@property (nonatomic, strong) Student *stu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _stu = [[Student alloc] initWithKeyPath:@"friends" target:self selector:@selector(nameDidChange:) options:NSKeyValueObservingOptionNew];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    _stu.name = @"chenliangjing";
    
    // 注意：监听集合类对象时，需要使用 mutableArrayValueForKey 方法改变属性值，才能监听的到
    [[_stu mutableArrayValueForKey:@"friends" ] replaceObjectAtIndex:0 withObject:@"lisi"];
//    [[_stu mutableSetValueForKey:@"foodSet"] removeObject:<#(nonnull id)#>:@"zhangsan"];
}

- (void)nameDidChange:(NSDictionary *)change
{
    if ([change[NSKeyValueChangeNotificationIsPriorKey] boolValue])
    {
        
        NSLog(@"+++++change = %@", change);
    }
    else
    {
        NSLog(@"-----change = %@", change);
    }
    
    // 改变前后的属性值
    id oldValue = change[NSKeyValueChangeOldKey];
    id newValue = change[NSKeyValueChangeNewKey];
    
    NSLog(@"oldValue = %@ newValue = %@", oldValue, newValue);
}

@end
