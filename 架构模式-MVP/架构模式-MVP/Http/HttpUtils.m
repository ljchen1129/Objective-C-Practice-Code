//
//  HttpUtils.m
//  架构模式-MVP
//
//  Created by 陈良静 on 2017/4/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "HttpUtils.h"
#import "SVProgressHUD.h"

@implementation HttpUtils

// get 请求
+ (void)getRequsetWithUrl:(NSString *)urlString callBack:(callBack)callBack
{
    // 1. 创建请求 URL
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2. 创建请求参数集合
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    // 3. 设置请求方式
    request.HTTPMethod = @"GET";
    
    // 4. 创建请求会话
    NSURLSession *seesion = [NSURLSession sharedSession];
    
    // 5. 创建一个请求任务
    [SVProgressHUD show];
    NSURLSessionDataTask *task = [seesion dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 7. 处理请求结果
        if (error != nil)
        {
            [SVProgressHUD setStatus:@"请求失败"];
            NSLog(@"请求失败 --- error = %@", error);
        }
        else
        {
            [SVProgressHUD dismiss];
            NSLog(@"请求成功");
            NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            if (error)
            {
                NSLog(@"error = %@", error);
                NSLog(@"json 解析失败！");
            }
            else
            {
                // 8. 回调请求结果
                callBack(jsonDict);
            }
        }
    }];
    
    // 6. 执行请求
    [task resume];
}

@end
