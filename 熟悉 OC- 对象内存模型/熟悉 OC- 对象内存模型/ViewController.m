//
//  ViewController.m
//  熟悉 OC- 对象内存模型
//
//  Created by 陈良静 on 2017/3/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "LJStudent.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    // 字典
//    NSDictionary *notLiteralDic = [NSDictionary dictionaryWithObjectsAndKeys: @"chenlj",@"name", @25, @"age", @"iOS", @"job", nil];
//    
//    // 读取
//    NSString *job = [notLiteralDic valueForKey:@"job"];
//    NSLog(@"job=%@", job);
//    
//    // 可变
//    NSMutableDictionary *notLiteralMdic = [notLiteralDic mutableCopy];
//    // 写入
//    [notLiteralMdic setObject:@"Andriod" forKey:@"job"];
//    NSLog(@"notLiteralMdic=%@", notLiteralMdic);
    
//    // 字典
//    NSDictionary *literalDic = @{@"name" : @"chenlj", @"age" : @25, @"job" : @"iOS"};
//    
//    // 读取
//    NSString *job = literalDic[@"job"];
//    NSLog(@"job=%@", job);
//    
//    // 可变
//    NSMutableDictionary *literalMdic = [literalDic mutableCopy];
//    
//    // 写入
//    literalMdic[@"job"] = @"Andriod";
//    NSLog(@"literalMdic=%@", literalMdic);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    /// 自己生成并持有对象-alloc
//    NSObject *obj1 = [[NSObject alloc] init];
//    
//    /// 自己生成并持有对象-new
//    NSObject *obj2 = [NSObject new];

//    LJStudent *stu1 = [[LJStudent alloc] init];
//    stu1.name = @"zhangsan";
//    /// 自己生成并持有对象
//    LJStudent *stu2 = [stu1 mutableCopy];
//    stu2.name = @"lisi";
//    stu2.name = @"wangwu";
//    NSLog(@"stu1:%p---stu2:%p\n",stu1, stu2);
//    NSLog(@"stu1.name:%@---stu2.name:%@",stu1.name, stu2.name);
    
    /// 取得非自己生成但自己持有的对象
//    id obj = [NSMutableArray array]; // 取得的对象存在，但变量 obj 并不持有
//    [obj release];
//    [obj retain]; // 自己持有对象
//    NSLog(@"Reference Count=%lu",[obj retainCount]);
    
    /// 自己生成并持有对象
//    id obj = [[NSObject alloc] init];
//    NSLog(@"Reference Count=%lu",[obj retainCount]);
//    /// 释放对象
//    [obj release];
//    NSLog(@"Reference Count=%lu",[obj retainCount]);
    
//    /// 1. 释放完后不再需要的对象
//    id obj1 = [[NSObject alloc] init];
//    [obj1 release]; // 对象已释放
//    [obj1 release]; // 再次释放，程序崩溃
//    
//    /// 2. 取得的对象存在，但自己不持有
//    id obj2 = [NSMutableArray array];
//    [obj2 release]; // 程序崩溃
//
    
    NSObject *obj = [[NSObject alloc] init];
   
    
    
}

@end
