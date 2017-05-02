//
//  ViewController.m
//  BlockCalculator
//
//  Created by 陈良静 on 2017/4/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorManager.h"
#import "NSObject+CalculatorManager.h"

@interface ViewController ()

@property(nonatomic, strong) CalculatorManager *cal;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

/// 是否正在输入
@property (nonatomic, assign) BOOL isInputting;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    double result = [NSObject makeCalculator:^(CalculatorManager *manager) {
        manager.add(12).minus(6).multiply(4).divide(2);
    }];
    NSLog(@"result = %f", result);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)digitTouch:(UIButton *)sender
{
    NSString *inputDigit = sender.currentTitle;
    if (self.isInputting)
    {
        NSString *currentTitle = self.displayLabel.text;
        self.displayLabel.text = [NSString stringWithFormat:@"%@%@",currentTitle, inputDigit];
    }
    else
    {
        if ([inputDigit isEqualToString:@"0"])
        {
            self.cal.reset();
        }
        self.displayLabel.text = inputDigit;
        self.isInputting = YES;
    }

}

- (IBAction)operation:(UIButton *)sender
{
    self.isInputting = NO;
    
    NSString *operator = sender.currentTitle;
    
    if ([operator isEqualToString:@"+"])
    {
        self.cal.add(self.displayLabel.text.doubleValue);
        self.displayLabel.text = [NSString stringWithFormat:@"%f", self.cal.equal()];

    }
    else if ([operator isEqualToString:@"-"])
    {
        self.cal.minus(self.displayLabel.text.doubleValue);
        self.displayLabel.text = [NSString stringWithFormat:@"%f", self.cal.equal()];
    }
    else if ([operator isEqualToString:@"☓"])
    {
        self.cal.multiply(self.displayLabel.text.doubleValue);
        self.displayLabel.text = [NSString stringWithFormat:@"%f", self.cal.equal()];
    }
    else if ([operator isEqualToString:@"➗"])
    {
        self.cal.divide(self.displayLabel.text.doubleValue);
    }
    else
    {
        self.displayLabel.text = [NSString stringWithFormat:@"%f", self.cal.equal()];
    }
}

#pragma mark - setter

- (CalculatorManager*)cal
{
    if (!_cal)
    {
        _cal = [[CalculatorManager alloc] init];
    }
    
    return _cal;
}

@end
