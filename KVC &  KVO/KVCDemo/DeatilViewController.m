//
//  DeatilViewController.m
//  KVC &  KVO
//
//  Created by 陈良静 on 2017/5/15.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "DeatilViewController.h"
#import "Contact.h"

@interface DeatilViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *nicknameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;

@end

@implementation DeatilViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 更新文本框
    [self updateTextFields];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)updateTextFields
{
    for (NSString *key in [self contactStringKeys])
    {
        [self textFieldForModelKey:key].text = [self.contact valueForKey:key];
    }
}


- (void)setContact:(Contact *)contact
{
    _contact = contact;
    [self updateTextFields];
}


- (NSArray *)contactStringKeys
{
    return @[@"name", @"nickname", @"email", @"city"];
}

- (UITextField *)textFieldForModelKey:(NSString *)key;
{
    return [self valueForKey:[key stringByAppendingString:@"Field"]];
}

@end
