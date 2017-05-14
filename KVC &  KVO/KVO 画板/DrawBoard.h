//
//  DrawBoard.h
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawBoard : UIView

// 删除所有线
- (void)deleteAll;

// 撤销
- (void)undo;

// 回退
- (void)redo;

@end
