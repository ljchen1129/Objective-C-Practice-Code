//
//  Person.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/11.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString *name;
    NSString *_name;
    NSString *isName;
}
///
//@property(nonatomic, copy) NSString *name;

- (NSString *)name;

@end
