//
//  ViewController.m
//  KVC_字典
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    Person *p = [Person new];
    p.name = @"chenliangjing";
    p.age = 26;

    // 1. 通过 key 的数组取出model 中的属性值组成一个字典返回
    NSDictionary *dic = [p dictionaryWithValuesForKeys:@[@"name", @"dog", @"age"]];
    NSLog(@"dic = %@", dic);
    
    Person *p2 = [Person new];
    NSDictionary *tempDic = @{@"name": @"zhangsan", @"age": @30, @"dog":[Dog new]};
    
    // 2. 通过一个字典给 model 设置属性
    [p2 setValuesForKeysWithDictionary:tempDic];
    NSLog(@"p2.name = %@, p2.age = %ld, p2.dog.dogName = %@", p2.name, p2.age, p2.dog.dogName);
    
}



@end
