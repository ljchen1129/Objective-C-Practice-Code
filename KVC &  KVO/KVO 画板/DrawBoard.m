//
//  DrawBoard.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "DrawBoard.h"

@interface DrawBoard ()
{
    UIBezierPath *_path;
    CAShapeLayer *_line;
    NSMutableArray *_lineArray; // 线条数组
    NSMutableArray *_canceledLineArray; // 撤销的线条数组
}

@end

@implementation DrawBoard

- (void)awakeFromNib
{
    NSLog(@"%s", __func__);
    [super awakeFromNib];
    _lineArray = [NSMutableArray array];
    _canceledLineArray = [NSMutableArray array];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:self];

    // 设置起点
    _path = [UIBezierPath bezierPath];
    [_path moveToPoint:startPoint];
    
    _line = [CAShapeLayer layer];
    
    // 图形边线路径
    _line.path = _path.CGPath;
    
    // 图形填充色，默认为黑色
    _line.fillColor = [UIColor clearColor].CGColor;
    
    // 线终点的样式
    _line.lineCap = kCALineCapRound;
    
    // 线拐点处的样式
    _line.lineJoin = kCALineJoinRound;
    
    // 边线的宽度
    _line.lineWidth = 3.f;
    
    // 边线的颜色
    [_line setStrokeColor:[UIColor blackColor].CGColor];
    
    [self.layer addSublayer:_line];
    
    // 把线条加入到数组
    // 注意：如果使用 KVO 观察数组属性的变化，应该使用 KVC 方法去获取数组
    [[self mutableArrayValueForKey:@"_lineArray"] addObject:_line];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint movePoint = [touch locationInView:self];
    
    // 目的点
    [_path addLineToPoint:movePoint];
    _line.path = _path.CGPath;
    
}

// 删除所有线
- (void)deleteAll
{
    if (!_lineArray.count)
    {
        return;
    }
    
    [_lineArray makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
    [[self mutableArrayValueForKey:@"_lineArray"] removeAllObjects];
    [[self mutableArrayValueForKey:@"_canceledLineArray"] removeAllObjects];
    
}

// 撤销
- (void)undo
{
    if (!_lineArray.count)
    {
        return;
    }
    
    [[self mutableArrayValueForKey:@"_canceledLineArray"] addObject: [_lineArray lastObject]];
    [[_lineArray lastObject] removeFromSuperlayer];
    [[self mutableArrayValueForKey:@"_lineArray"] removeLastObject];
}

// 回退
- (void)redo
{
    if (!_canceledLineArray.count)
    {
        return;
    }
    
    [self.layer addSublayer: [_canceledLineArray firstObject]];
    [[self mutableArrayValueForKey:@"_lineArray"] addObject:[_canceledLineArray firstObject]];
    [[self mutableArrayValueForKey:@"_canceledLineArray"] removeObjectAtIndex:0];
}

@end
