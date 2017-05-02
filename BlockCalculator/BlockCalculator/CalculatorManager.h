//
//  CalculatorManager.h
//  BlockCalculator
//
//  Created by 陈良静 on 2017/4/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorManager : NSObject

/// 加法
- (CalculatorManager *(^)(double value))add;
/// 减法
- (CalculatorManager *(^)(double value))minus;
/// 乘法
- (CalculatorManager *(^)(double value))multiply;
/// 除法
- (CalculatorManager *(^)(double value))divide;


- (CalculatorManager *(^)())brackets;

- (void (^)())reset;

- (double (^)())equal;

@end
