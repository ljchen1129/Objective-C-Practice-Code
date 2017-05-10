//
//  User.h
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property(nonatomic, copy) NSString *profile_image_url;

@property(nonatomic, assign) BOOL vip;

@property(nonatomic, copy) NSString *name;

@property(nonatomic, strong) NSNumber *mbrank;

@property(nonatomic, strong) NSNumber *mbtype;

@end
