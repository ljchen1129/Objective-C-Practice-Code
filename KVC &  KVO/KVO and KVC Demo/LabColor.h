//
//  LabColor.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/14.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabColor : NSObject

// Lab 色彩空间
@property(nonatomic, assign) double lComponent;
@property(nonatomic, assign) double aComponent;
@property(nonatomic, assign) double bComponent;

// RGB 色彩空间
@property(nonatomic, assign) double redComponent;
@property(nonatomic, assign) double greenComponent;
@property(nonatomic, assign) double blueComponent;

@property(nonatomic, strong, readonly) UIColor *color;

@end
