//
//  main.m
//  ARC
//
//  Created by 陈良静 on 2017/4/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p1 = [[Person alloc] init];
        __strong Person *p2 = [[Person alloc] init];
        
        __weak Person *p3 = [[Person alloc] init];
    
    }
    return 0;
}
