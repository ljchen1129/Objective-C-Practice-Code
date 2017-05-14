//
//  ViewController.m
//  KVO 画板
//
//  Created by 陈良静 on 2017/5/12.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "DrawBoard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DrawBoard *drawBorad;
@property (weak, nonatomic) IBOutlet UIButton *deleteAllBtn;
@property (weak, nonatomic) IBOutlet UIButton *undoBtn;
@property (weak, nonatomic) IBOutlet UIButton *redoBtn;

@end

@implementation ViewController

#pragma  mark - lifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 添加观察者
    [_drawBorad addObserver:self forKeyPath:@"_lineArray" options:NSKeyValueObservingOptionNew context:nil];
    [_drawBorad addObserver:self forKeyPath:@"_canceledLineArray" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
    // 移除观察者
    [_drawBorad removeObserver:self forKeyPath:@"_lineArray"];
    [_drawBorad removeObserver:self forKeyPath:@"_canceledLineArray"];
}

#pragma mark - KVO Response

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"change = %@", change);
    if ([keyPath isEqualToString:@"_lineArray"])
    {
        // 如果有值
        [self.undoBtn setEnabled:[_drawBorad mutableArrayValueForKey:@"_lineArray"].count];
    }
    else
    {
        if ([keyPath isEqualToString:@"_canceledLineArray"])
        {
     
            [self.redoBtn setEnabled:[_drawBorad mutableArrayValueForKey:@"_canceledLineArray"].count];
        }
    }
}

#pragma mark - eventResponse

- (IBAction)backBTn:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)deleteAll:(id)sender
{
    [_drawBorad deleteAll];
}

- (IBAction)undoBtn:(id)sender
{
    [_drawBorad undo];
}

- (IBAction)redoBtn:(id)sender
{
    [_drawBorad redo];
}

@end
