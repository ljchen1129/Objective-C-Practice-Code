//
//  School.h
//  Protocol
//
//  Created by 陈良静 on 2017/4/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol StudentCondition <NSObject>
// 声明协议方法
- (void)study;
- (void)exam;

@end

@interface School : NSObject

/// 学生
@property(nonatomic, strong) id<StudentCondition> delegate;

- (void)studentStudy;

@end
