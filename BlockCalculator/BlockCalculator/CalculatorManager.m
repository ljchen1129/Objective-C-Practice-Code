//
//  CalculatorManager.m
//  BlockCalculator
//
//  Created by 陈良静 on 2017/4/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "CalculatorManager.h"

@implementation CalculatorManager
{
    double _result;
}

- (CalculatorManager *(^)(double value))add
{
    return ^CalculatorManager * (double value){
        _result += value;
        return self;
    };
}

- (CalculatorManager *(^)(double value))minus
{
    return ^CalculatorManager * (double value){
        _result -= value;
        return self;
    };
}

- (CalculatorManager *(^)(double value))multiply
{
    return ^CalculatorManager * (double value){
        _result *= value;
        return self;
    };
}

- (CalculatorManager *(^)(double value))divide
{
    return ^CalculatorManager * (double value){
        _result /= value;
        return self;
    };
}

- (CalculatorManager *(^)())brackets
{
    return ^CalculatorManager *{
        _result = (_result);
        return self;
    };

}

- (void (^)())reset
{
    return ^{
        _result = 0.0;
    };
}

- (double (^)())equal
{
    return ^double{
        return _result;
    };
}

@end
