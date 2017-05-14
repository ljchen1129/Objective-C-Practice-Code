//
//  LabColor.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/14.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "LabColor.h"

static double inverseF(double const t);
static double D65TristimulusValues[3] = {95.047, 100.0, 108.883};

@implementation LabColor

- (id)init
{
    self = [super init];
    if (self) {
        self.lComponent = 75 + (arc4random_uniform(200) * 0.1 - 10.);
        self.aComponent = 0 + (arc4random_uniform(200) * 0.1 - 10.);
        self.bComponent = 0 + (arc4random_uniform(200) * 0.1 - 10.);
    }
    return self;
}

- (double)redComponent;
{
    return D65TristimulusValues[0] * inverseF(1./116. * (self.lComponent + 16));
}

- (double)greenComponent
{
    return D65TristimulusValues[1] * inverseF(1./116. * (self.lComponent + 16) + 1./500.*self.aComponent);
}

- (double)blueComponent
{
    return D65TristimulusValues[2] * inverseF(1./116. * (self.lComponent + 16) - 1./200.*self.bComponent);
}

// 属性依赖，一旦监听到 lComponent 值发生变化，就相当于属性 redComponent 也发生变化，同样会发送通知出去
+ (NSSet *)keyPathsForValuesAffectingRedComponent
{
    return [NSSet setWithObject:@"lComponent"];
}

+ (NSSet *)keyPathsForValuesAffectingGreenComponent
{
    return [NSSet setWithObjects:@"lComponent", @"aComponent", nil];
}

+ (NSSet *)keyPathsForValuesAffectingBlueComponent
{
    return [NSSet setWithObjects:@"lComponent", @"bComponent", nil];
}

- (UIColor *)color
{
    return [UIColor colorWithRed:self.redComponent * 0.01 green:self.greenComponent * 0.01 blue:self.blueComponent * 0.01 alpha:1.];
}

// 属性 color 的依赖
+ (NSSet *)keyPathsForValuesAffectingColor
{
    return [NSSet setWithObjects:@"redComponent", @"greenComponent", @"blueComponent", nil];
}

@end

static double inverseF(double const t)
{
    return ((t > 6./29.) ?
            t*t*t :
            3.*(6./29.)*(6./29.)*(t-4./29.));
}
