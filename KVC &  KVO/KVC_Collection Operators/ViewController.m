//
//  ViewController.m
//  KVC_Collection Operators
//
//  Created by 陈良静 on 2017/5/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Dog.h"
#import "Food.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self collectionForArray];
//    [self collectionForSet];
//    [self collectionForObjectArray];
//    [self collectionForObjectOperator];
    [self collectionForArrarOrSetOperator];
}

- (void)collectionForObjectArray
{
    NSMutableArray *personArray = [NSMutableArray array];
    for (int i = 0; i < 5; i ++)
    {
        Person *p = [Person new];
        p.name = [NSString stringWithFormat:@"name%d", i];
        p.height = 1.68 + (CGFloat)(i * 0.1);
        p.date = [NSDate dateWithTimeIntervalSinceNow:i * 3600];
        p.dog.food.foodName = [NSString stringWithFormat:@"狗粮：000%d", i];
        [personArray addObject:p];
    }
    
    // 1.1. @avg  平均数
    NSString *avgForPersonArray = [personArray valueForKeyPath:@"@max.dog.food.foodName"];
    NSLog(@"avgForPersonArray = %@", avgForPersonArray); // avgForPersonArray = 狗粮：0004
    
    
    // 1.2. @count 集合元素个数
    NSNumber *countForPersonArray = [personArray valueForKeyPath:@"@count"];
    NSLog(@"countForTempPersonArray = %@", countForPersonArray); // countForTempPersonArray = 5
    
    // 1.3. @max 集合中最大的元素
    NSNumber *maxForPersonArray = [personArray valueForKeyPath:@"@max.height"];
    NSLog(@"maxForPersonArray = %@", maxForPersonArray); // maxForPersonArray = 2.08
    
    
    // 1.4. @min 集合中最小的元素
    NSNumber *minForPersonArray = [personArray valueForKeyPath:@"@min.height"];
    NSLog(@"minForPersonArray = %@", minForPersonArray); // minForPersonArray = 1.68
    
    // 1.5. @sum 集合中元素的和
    NSNumber *sumForPersonArray = [personArray valueForKeyPath:@"@sum.height"];
    NSLog(@"sumForPersonArray = %@", sumForPersonArray); // sumForPersonArray = 9.4
    
}

// 集合->数组
- (void)collectionForArray
{
    // 1. Simple Collection Operators(简单的操作符)
    NSArray *tempArr = @[@4, @8, @19, @46, @90];
    
    // 1.1. @avg  平均数
    NSNumber *avgForTempArr = [tempArr valueForKeyPath:@"@avg.self"];
    NSLog(@"avgForTempArr = %@", avgForTempArr); // avgForTempArr = 33.4
    
    
    // 1.2. @count 集合元素个数
    NSNumber *countForTempArr = [tempArr valueForKeyPath:@"@count"];
    NSLog(@"countForTempArr = %@", countForTempArr); // countForTempArr = 5
    
    // 1.3. @max 集合中最大的元素
    NSNumber *maxForTempArr = [tempArr valueForKeyPath:@"@max.self"];
    NSLog(@"maxForTempArr = %@", maxForTempArr); // maxForTempArr = 90
    
    
    // 1.4. @min 集合中最小的元素
    NSNumber *minForTempArr = [tempArr valueForKeyPath:@"@min.self"];
    NSLog(@"minForTempArr = %@", minForTempArr); // minForTempArr = 4
    
    // 1.5. @sum 集合中元素的和
    NSNumber *sumForTempArr = [tempArr valueForKeyPath:@"@sum.self"];
    NSLog(@"sumForTempArr = %@", sumForTempArr); // sumForTempArr = 167
}

// 集合->Set
- (void)collectionForSet
{
    // 1. Simple Collection Operators(简单的操作符)
    NSSet *tempSet = [NSSet setWithObjects:@12, @32, @13, @67, @9, nil];
    
    // 1.1. @avg  平均数
    NSNumber *avgForTempSet = [tempSet valueForKeyPath:@"@avg.self"];
    NSLog(@"avgForTempSet = %@", avgForTempSet); // avgForTempSet = 26.6
    
    
    // 1.2. @count 集合元素个数
    NSNumber *countForTempSet = [tempSet valueForKeyPath:@"@count"];
    NSLog(@"countForTempSet = %@", countForTempSet); // countForTempSet = 5
    
    // 1.3. @max 集合中最大的元素
    NSNumber *maxForTempSet = [tempSet valueForKeyPath:@"@max.self"];
    NSLog(@"maxForTempSet = %@", maxForTempSet); // maxForTempSet = 67
    
    
    // 1.4. @min 集合中最小的元素
    NSNumber *minForTempSet = [tempSet valueForKeyPath:@"@min.self"];
    NSLog(@"minForTempSet = %@", minForTempSet); // minForTempSet = 9
    
    // 1.5. @sum 集合中元素的和
    NSNumber *sumForTempSet = [tempSet valueForKeyPath:@"@sum.self"];
    NSLog(@"sumForTempSet = %@", sumForTempSet); // sumForTempSet = 133
}

// 对象操作符
- (void)collectionForObjectOperator
{
    NSMutableArray *personArray = [NSMutableArray array];
    for (int i = 0; i < 5; i ++)
    {
        Person *p = [Person new];
        p.name = [NSString stringWithFormat:@"name%d", i];
        p.height = 1.68 + (CGFloat)(i * 0.1);
        p.date = [NSDate dateWithTimeIntervalSinceNow:i * 3600];
        if (i < 3)
        {
             p.dog.food.foodName = @"狗粮";
        }
        else
        {
            p.dog.food.foodName = [NSString stringWithFormat:@"狗粮：000%d", i];
        }
        
        [personArray addObject:p];
    }
    
    // 1. distinctUnionOfObjects：返回一个由操作符右边的 `key path` 所指定的对象属性组成的数组，不对数组去重
    NSArray *distinctUnionOfObjects = [personArray valueForKeyPath:@"@distinctUnionOfObjects.dog.food.foodName"];
    NSLog(@"distinctUnionOfObjects = %@", distinctUnionOfObjects);
    
    // 2. unionOfObjects：返回一个由操作符右边的 `key path` 所指定的对象属性组成的数组，对数组去重
    NSArray *unionOfObjects = [personArray valueForKeyPath:@"@unionOfObjects.dog.food.foodName"];
    NSLog(@"unionOfObjects = %@", unionOfObjects);
}


// 数组或set操作符
- (void)collectionForArrarOrSetOperator
{
    NSMutableArray *personArray = [NSMutableArray array];
    for (int i = 0; i < 5; i ++)
    {
        Person *p = [Person new];
        p.name = [NSString stringWithFormat:@"name%d", i];
        p.height = 1.68 + (CGFloat)(i * 0.1);
        p.date = [NSDate dateWithTimeIntervalSinceNow:i * 3600];
        if (i < 3)
        {
            p.dog.food.foodName = @"狗粮";
        }
        else
        {
            p.dog.food.foodName = [NSString stringWithFormat:@"狗粮：000%d", i];
        }
        
        [personArray addObject:p];
    }
    
    // 1. distinctUnionOfObjects：返回一个由操作符右边的 `key path` 所指定的对象属性组成的数组，不对数组去重
    NSArray *distinctUnionOfObjects = [personArray valueForKeyPath:@"@distinctUnionOfObjects.dog.food.foodName"];
    NSLog(@"distinctUnionOfObjects = %@", distinctUnionOfObjects);
    
    // 2. unionOfObjects：返回一个由操作符右边的 `key path` 所指定的对象属性组成的数组，对数组去重
    NSArray *unionOfObjects = [personArray valueForKeyPath:@"@unionOfObjects.dog.food.foodName"];
    NSLog(@"unionOfObjects = %@", unionOfObjects);

    // 3. 针对集合的集合（不去重）
    NSArray *distinctUnionOfArrays = [@[personArray, personArray] valueForKeyPath:@"@distinctUnionOfArrays.dog.food.foodName"];
    NSLog(@"distinctUnionOfArrays = %@", distinctUnionOfArrays);
    
    // 4. 针对集合的集合（去重）
    NSArray *unionOfArrays = [@[personArray, personArray] valueForKeyPath:@"@unionOfArrays.dog.food.foodName"];
    NSLog(@"unionOfArrays = %@", unionOfArrays);
}

@end
