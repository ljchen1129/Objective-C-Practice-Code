//
//  main.m
//  Copy
//
//  Created by 陈良静 on 2017/4/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    
    // 1. 可变对象调用 copy
//    NSMutableString *mStr = [NSMutableString stringWithFormat:@"chen"];
//    NSString *copyStr = [mStr copy];
//    NSLog(@"mStr:%p,copyStr:%p", mStr, copyStr);

    // 2. 可变对象调用 mutableCopy
//    NSMutableString *mStr = [NSMutableString stringWithFormat:@"chen"];
//    NSMutableString *copyStr = [mStr mutableCopy];
//    NSLog(@"mStr:%p,copyStr:%p", mStr, copyStr);
//    [copyStr appendFormat:@"liangjing"];
//    NSLog(@"mStr:%@,copyStr:%@", mStr, copyStr);

    // 3. 不可变对象调用 mutableCopy
//    NSString *str = [NSString stringWithFormat:@"chen"];
//    NSMutableString *mutableCopyStr = [str mutableCopy];
//    NSLog(@"str:%p,mutableCopyStr:%p", str, mutableCopyStr);
//    [mutableCopyStr appendFormat:@"liangjing"];
//    NSLog(@"str:%@,mutableCopyStr:%@", str, mutableCopyStr);
    
    // 4. 不可变对象调用 copy
//    NSString *str = [NSString stringWithFormat:@"chen"];
//    NSString *copyStr = [str copy];
//    NSLog(@"str:%p,copyStr:%p", str, copyStr);
    
    
    // copy 内存管理，浅拷贝
//    NSString *str = [[NSString alloc] initWithFormat:@"chenliangjing"];
//    NSLog(@"retainCount:%lu", [str retainCount]); // retainCount:1
//    NSString *copyStr = [str copy];
//    NSLog(@"str:%p,copyStr:%p", str, copyStr);
//    NSLog(@"retainCount:%lu", [str retainCount]); // retainCount:2
    
    // copy 内存管理，深拷贝
//    NSMutableString *mStr = [[NSMutableString alloc] initWithFormat:@"chenliangjing"];
//    NSLog(@"mStrRetainCount:%lu", [mStr retainCount]); // mStrRetainCount:1
//    NSString *copyStr = [mStr copy];
//    NSLog(@"str:%p,copyStr:%p", mStr, copyStr); // 生成新对象
//    NSLog(@"mStrRetainCount:%lu", [mStr retainCount]); // mStrRetainCount:1
//    NSLog(@"copyStrRetainCount:%lu", [copyStr retainCount]); // copyStrRetainCount:1
    
    // Copy 和 Property
//    Person *p = [Person new];
//    NSMutableString *mStr = [NSMutableString stringWithFormat:@"chen"];
//    p.name = mStr;
//    NSLog(@"p.name = %@", p.name); // p.name = chen
//    // 外界修改 mStr
//    [mStr appendFormat:@"liangjing"];
//    NSLog(@"p.name = %@", p.name); // p.name = chenliangjing
//    
    // Copy 和 block
//    Person *p = [Person new];
//    NSLog(@"retainCount = %lu", [p retainCount]);
//    void (^myBlock)() = ^{
//        NSLog(@"retainCount = %lu", [p retainCount]);
//    };
//    myBlock();
    
    // Copy block 引发的循环引用
//    __block Person *p = [Person new];
//    NSLog(@"retainCount = %lu", [p retainCount]);
//    p.myBlock = ^{
//        NSLog(@"retainCount = %lu", [p retainCount]);
//    };
//    
//    p.myBlock();
//    [p release];
//
 
    
    
    
    
    
    
    
    return 0;
}
