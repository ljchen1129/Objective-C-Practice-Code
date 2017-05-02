//
//  main.m
//  NSDate
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // 1. 创建
    // date 方法创建的时期对象，对象中就保存了当前时间
    NSDate *now = [NSDate date];
    NSLog(@"now = %@", now);
    
    // 在 now 的时间基础上追加多少秒
//    NSDate *date = [now dateByAddingTimeInterval:8 * 60 * 60];
//    NSLog(@"date = %@", date);
    
    
    // 1.1 获取当前所处的时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    // 1.2 获取当前时区和指定时间的时间差
    NSInteger seconds = [zone secondsFromGMTForDate:now];
    NSDate *newDate = [now dateByAddingTimeInterval:seconds];
    NSLog(@"newDate = %@", newDate);
    
    
    // 2. 时间格式化
    // 创建时间格式化对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    // 指定时间的格式
    //yyyy : 年
    //MM : 月
    //dd : 日
    //HH : 时
    //mm : 分
    //ss : 秒
    // Z : 时区
    fmt.dateFormat = @"yyyy年MM月dd日 HH时mm分ss秒";
    
    // 利用时间格式对象对时间进行格式化
    NSString *result = [fmt stringFromDate:[NSDate date]];
    NSLog(@"result = %@", result); //  result = 2017年04月26日 21时43分14秒
    
    
    // 3. 字符串转成时间对象
    NSString *str = @"2017年04月26日 21时43分14秒";
    NSDateFormatter *farmat = [[NSDateFormatter alloc] init];
    
    // 注意：str 的时间格式要和指定的 dateFormat 保持一致
    farmat.dateFormat = @"yyyy年MM月dd日 HH时mm分ss秒";
    NSDate *date = [farmat dateFromString:str];
    NSLog(@"date = %@", date); //  date = 2017-04-26 13:43:14 +0000
    
    
    return 0;
}
