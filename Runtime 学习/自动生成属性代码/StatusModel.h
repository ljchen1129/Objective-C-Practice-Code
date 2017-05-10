//
//  StatusModel.h
//  Runtime 学习
//
//  Created by 陈良静 on 2017/5/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusModel : NSObject

@property(nonatomic, copy) NSString *source;

@property(nonatomic, strong) NSNumber *reposts_count;

@property(nonatomic, strong) NSArray *pic_urls;

@property(nonatomic, copy) NSString *created_at;

@property(nonatomic, assign) BOOL isFriend;

@property(nonatomic, strong) NSNumber *attitudes_count;

@property(nonatomic, copy) NSString *idstr;

@property(nonatomic, copy) NSString *text;

@property(nonatomic, strong) NSNumber *comments_count;

@property(nonatomic, strong) NSDictionary *user;

@end
