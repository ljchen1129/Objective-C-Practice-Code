//
//  NSObject+CalculatorManager.m
//  BlockCalculator
//
//  Created by 陈良静 on 2017/4/16.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "NSObject+CalculatorManager.h"
#import "CalculatorManager.h"

@implementation NSObject (CalculatorManager)

+ (double)makeCalculator:(void(^)(CalculatorManager *manager))calculator;{
    
    // 1. 创建 CalculatorManager 对象实例
    CalculatorManager *cal = [[CalculatorManager alloc] init];
    
    // 2. 调用block
    calculator(cal);
    
    // 3. 返回计算结果
    return cal.equal();
}

@end
