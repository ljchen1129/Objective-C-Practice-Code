//
//  main.m
//  NSNumber
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
  
    int age = 25;
    float height = 1.70;
    BOOL isMale = YES;
    
    // 1. 将基本数据类型转换成对象类型
    NSNumber *ageN = [NSNumber numberWithInt:age];
    NSNumber *heightN = [NSNumber numberWithFloat:height];
    NSNumber *maleN = [NSNumber numberWithBool:isMale];
    NSLog(@"ageN = %@, heightN = %@, maleN = %@", ageN, heightN, maleN); //  ageN = 25, heightN = 1.7, maleN = 1
    
    // 2. 将对象类型转换成基本数据类型
    int ageT = [ageN intValue];
    float heightT = [heightN floatValue];
    BOOL isMaleT = [maleN boolValue];
    NSLog(@"ageT = %d, heightT = %f, isMaleT = %i", ageT, heightT, isMaleT); // ageT = 25, heightT = 1.700000, isMaleT = 1
    
    // 3 .基本数据类型转成对象类型简写
    NSNumber *intN = @29;
    NSNumber *doubleN = @29.897;
    NSNumber *boolN = @NO;
    
    // 注意：如果传入的是变量，需要将变量用 () 包装起来，如果传入的是常量， () 可以省略
    float temp = 24.89;
    NSNumber *floatN = @(temp);
    NSLog(@"intN = %@, doubleN = %@, boolN = %@, floatN = %@", intN, doubleN, boolN, floatN); // intN = 29, doubleN = 29.897, boolN = 0, floatN = 24.89
    
    return 0;
}
