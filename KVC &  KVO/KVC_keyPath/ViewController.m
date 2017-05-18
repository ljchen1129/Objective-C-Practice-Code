//
//  ViewController.m
//  KVC_keyPath
//
//  Created by 陈良静 on 2017/5/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Dog.h"

@interface ViewController ()

@property(nonatomic, strong) Person *p;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _p = [Person new];
    
    // 1. 人的名字
    id name = [_p valueForKeyPath:@"name"];
    
    // 2. 狗的生日，包括年月日
    id dogBirthday = [_p valueForKeyPath:@"dog.birthday"];
    NSValue *value = (NSValue *)dogBirthday;
    
    // 从 value 中取出结构体变量
    DogBirthday birthday;
    [value getValue:&birthday];
    
    // 3. 狗的身高
    id dogHeight = [_p valueForKeyPath:@"dog.height"];
    
    // 4. 狗要吃的食物名称
    id dogFoodName = [_p valueForKeyPath:@"dog.food.foodName"];
    
    // 打印人名/数据类型
    NSLog(@"name = %@ %@", name, [name class]); // name = chenliangjing __NSCFConstantString
    
    // 打印狗的生日/数据类型
    NSLog(@"dogBirthday = %@ %@", dogBirthday, [dogBirthday class]); // dogBirthday = <e1070000 00000000 05000000 00000000 0f000000 00000000> NSConcreteValue
    // 打印狗的生日(年、月、日)
    NSLog(@"year = %lu mouth = %lu day = %lu", birthday.year, birthday.mouth, birthday.day); // year = 2017 mouth = 5 day = 15
    // 打印狗的身高/数据类型
    NSLog(@"dogHeight = %@ %@", dogHeight, [dogHeight class]); // dogHeight = 1.3 __NSCFNumber
    // 打印狗的事物名称/数据类型
    NSLog(@"dogFoodName = %@ %@", dogFoodName, [dogFoodName class]); // dogFoodName = 狗粮 __NSCFConstantString
}


@end
