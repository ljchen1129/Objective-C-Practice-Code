//
//  main.m
//  Protocol
//
//  Created by 陈良静 on 2017/4/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Student.h"
//#import "School.h"
#import "Person.h"
#import "LinkHome.h"


int main(int argc, const char * argv[]) {
    
    //    LinkHome *lh = [LinkHome new];
    //
    //    // 链家中介成为人的代理，帮人找房子
    //    p.delegate = lh;
    //
    //    // 找房子
    //    [p findHourse];
    
    Person *p = [Person new];
    NSLog(@"retainCount = %lu", [p retainCount]); // retainCount = 1
    NSMutableArray *arrayM = [[NSMutableArray alloc] init];
    [arrayM addObject:p];
    NSLog(@"retainCount = %lu", [p retainCount]); // retainCount = 2
    
    [p release];
    NSLog(@"retainCount = %lu", [p retainCount]); // retainCount = 1
    [arrayM removeObject:p];
    
    
    return 0;
}
