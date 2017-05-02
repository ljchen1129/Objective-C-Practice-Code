//
//  main.m
//  MutiObjectManager
//
//  Created by 陈良静 on 2017/4/10.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Room : NSObject

@property int roomNo;

@end

@implementation Room

- (void)dealloc
{
    NSLog(@"%s, rooNo = %i", __func__, _roomNo);
    
    [super dealloc];
}

@end

@interface Person : NSObject

@property (nonatomic, retain) Room *room;

@end

@implementation Person

+ (instancetype)person
{
    return [[[self alloc] init] autorelease];
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    
    [_room release];
    [super dealloc];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool { // 栈底自动释放池
        @autoreleasepool {
            @autoreleasepool { // 栈顶自动释放池
                Person *p = [[[Person alloc] init] autorelease];
                
            } // 销毁自动释放池（会给池子中的所有对象发送一条 release 消息）
            Person *p = [[[Person alloc] init] autorelease];
        }
    }
    
   
    
    return 0;
}
