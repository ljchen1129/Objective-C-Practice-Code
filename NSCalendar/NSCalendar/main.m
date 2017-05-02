//
//  main.m
//  NSCalendar
//
//  Created by 陈良静 on 2017/4/26.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

    // 获取当前时间
    NSDate *now = [NSDate date];
    NSLog(@"now = %@", now);
    
    // 1. 日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitYear |
                            NSCalendarUnitMonth |
                            NSCalendarUnitDay |
                            NSCalendarUnitHour |
                            NSCalendarUnitMinute |
                            NSCalendarUnitSecond;
    
    // 利用日历类从当前时间中获取单独的年、月，日，时，分，秒
    NSDateComponents *cmps = [calendar components:type fromDate:now];
    NSLog(@"year = %ld", cmps.year);
    NSLog(@"month = %ld", cmps.month);
    NSLog(@"day = %ld", cmps.day);
    NSLog(@"hour = %ld", cmps.hour);
    NSLog(@"minute = %ld", cmps.minute);
    NSLog(@"second = %ld", cmps.second);
    
    
    // 2. 比较两个时间之间的差值，比较相差多少年多少月多少日多少时多少分多少秒
    // 2.1 过去的一个时间
    NSString *str = @"2017年04月26日 21时43分14秒";
    NSDateFormatter *farmat = [[NSDateFormatter alloc] init];
    
    // 注意：str 的时间格式要和指定的 dateFormat 保持一致
    farmat.dateFormat = @"yyyy年MM月dd日 HH时mm分ss秒";
    NSDate *date = [farmat dateFromString:str];
    NSLog(@"date = %@", date); //  date = 2017-04-26 13:43:14 +0000
    
    // 2.2 现在的一个时间
    NSDate *nowN = [NSDate date];
    
    // 2.3 比较两个时间
    NSCalendar *calendarN = [NSCalendar currentCalendar];
    NSDateComponents *cmpsN = [calendarN components:type fromDate:date toDate:nowN options:0];
    NSLog(@"年：%ld, 月：%ld, 日：%ld, 时：%ld, 分：%ld, 秒：%ld", cmpsN.year, cmpsN.month, cmpsN.day, cmpsN.hour, cmpsN.minute, cmpsN.second); // 年：0, 月：0, 日：0, 时：0, 分：40, 秒：59
    
    
    
    
    return 0;
}
