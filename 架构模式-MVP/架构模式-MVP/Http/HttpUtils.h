//
//  HttpUtils.h
//  架构模式-MVP
//
//  Created by 陈良静 on 2017/4/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^callBack)(NSDictionary *dict);

@interface HttpUtils : NSObject

// get 请求
+ (void)getRequsetWithUrl:(NSString *)urlString callBack:(callBack)callBack;

@end
