//
//  App.h
//  iOS 多线程-NSOperation
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface App : NSObject

/// 图标
@property(nonatomic, copy) NSString *icon;

/// 下载量
@property(nonatomic, copy) NSString *download;

/// 名字
@property(nonatomic, copy) NSString *name;

+ (instancetype)appsWithDictionary:(NSDictionary *)dict;

@end
