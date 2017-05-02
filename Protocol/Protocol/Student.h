//
//  Student.h
//  Protocol
//
//  Created by 陈良静 on 2017/4/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol StudentCondition;

@interface Student : NSObject<StudentCondition> // 遵守协议

@end
