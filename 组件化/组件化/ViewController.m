//
//  ViewController.m
//  组件化
//
//  Created by 陈良静 on 2017/4/18.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import <objc/objc-runtime.h>

@interface ViewController ()

@end

NSArray *ClassGetSubclasses(Class parentClass) {
    int numClasses = objc_getClassList(NULL, 0);
    Class *classes = NULL;
    classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
    
    numClasses = objc_getClassList(classes, numClasses);
    
    NSMutableArray *result = [NSMutableArray array];
    
    for (NSInteger i = 0; i < numClasses; i++) {
        
        Class superClass = classes[i];
        
        do{
            
            superClass = class_getSuperclass(superClass);
            
        } while(superClass && superClass != parentClass);
        
        if (superClass == nil) {
            
            continue;
            
        }
        
        [result addObject:classes[i]];
        
    }
    
    free(classes);
    
    return result;
}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    NSArray *subClasses = ClassGetSubclasses([UIView class]);
    NSLog(@"%@", subClasses);
    
    
}

//- (void)viewDidAppear:(BOOL)animated
//{
//    [super viewDidAppear:animated];
//    NSLog(@"%s", __func__);
//}
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    NSLog(@"%s", __func__);
//}
//
//- (void)awakeFromNib
//{
//    NSLog(@"%s", __func__);
//}
//
//- (void)loadView
//{
//    [super loadView];
//    
//    UIResponder *res = [UIResponder ]
//    NSLog(@"%s", __func__);
//}

- (void)gotoDetail
{
    Class cls = NSClassFromString(@"DetailViewController");
    
    UIViewController *detailVc = [cls performSelector:NSSelectorFromString(@"detailViewController:") withObject:@"DetailViewController"];
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)gotoOther
{
    Class cls = NSClassFromString(@"OtherViewController");
    
    UIViewController *otherVc = [cls performSelector:NSSelectorFromString(@"otherViewController:") withObject:@"otherViewController"];
    [self.navigationController pushViewController:otherVc animated:YES];
}

- (IBAction)detailClick:(UIButton *)sender
{
    [self gotoDetail];
}

- (IBAction)otherClick:(UIButton *)sender
{
    [self gotoOther];
}


@end
