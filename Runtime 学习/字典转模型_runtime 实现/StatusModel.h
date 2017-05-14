//
//  StatusModel.h
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+PropertyRuntime.h"
@class User;

@interface StatusModel : NSObject <ModelDelegate>

@property(nonatomic, copy) NSString *source;

@property(nonatomic, strong) NSNumber *reposts_count;

@property(nonatomic, strong) NSArray *pic_urls;

@property(nonatomic, copy) NSString *created_at;

@property(nonatomic, strong) NSNumber *attitudes_count;

@property(nonatomic, copy) NSString *idst;

@property(nonatomic, copy) NSString *text;

@property(nonatomic, strong) NSNumber *comments_count;

@property(nonatomic, strong) User *user;

@end
