//
//  main.m
//  OC 对象内存存储细节
//
//  Created by 陈良静 on 2017/4/6.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct {
    int year;
    int month;
    int day;
}Date;

@interface Person : NSObject
{
    @public
    Date _brithday;
}

- (void)sayBrithday;

@end

@implementation Person
- (void)sayBrithday
{
    NSLog(@"brithday.year = %i, brithday.mouth = %i, brithday.day = %i",_brithday.year, _brithday.month, _brithday.day);
}

@end


int main(int argc, const char * argv[]) {
  
    // 通过类创建对象
    /*
     1. 开辟存储空间
     2. 初始化所有属性
     3. 返回指针地址
     */
    Person *p = [Person new];
    p->_brithday = (Date){1991, 5, 23};
    
    
    // 等价于下面这种，本质是复制了一份一模一样副本
    Date d1 = {1991, 5, 23};
    Date d2;
    d2 = d1;

    [p sayBrithday];
    
        
    return 0;
}
