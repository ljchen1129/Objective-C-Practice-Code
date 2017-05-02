//
//  NSObject+CalculatorManager.h
//  BlockCalculator
//
//  Created by 陈良静 on 2017/4/16.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CalculatorManager;

@interface NSObject (CalculatorManager)


/**
 链式调用

 @param calculator void(^)(CalculatorManager *manager) 类型 block
 @return 返回计算的结果
 */
+ (double)makeCalculator:(void(^)(CalculatorManager *manager))calculator;

@end
