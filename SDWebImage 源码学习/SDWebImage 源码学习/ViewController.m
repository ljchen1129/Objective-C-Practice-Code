//
//  ViewController.m
//  SDWebImage 源码学习
//
//  Created by 陈良静 on 2017/5/3.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "App.h"
#import <UIImageView+WebCache.h>

@interface ViewController () <UITableViewDataSource, UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) NSArray *apps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"CellId"];
    }
    
    App *a = self.apps[indexPath.row];
    cell.textLabel.text = a.name;
    cell.detailTextLabel.text = a.download;
    
    // 给 UIImageView 视图下载并设置图片
    // 参数一 URL：图片资源路径
    // 参数二 placeholderImage ：占位图片
    // 参数三 options ：选择枚举，图片下载选项操作
    // 参数四 progress： 图片下载过程进度回调（receivedSize ： 已下载的图片数据大小，expectedSize：图片真实的数据大小，targetURL：图片资源目标路径）
    // 参数五 completed：图片下载完毕回调（image ：图片，error：错误信息，cacheType：枚举，缓存类型，imageURL：图片目标路径）
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:a.icon] placeholderImage:[UIImage imageNamed:@"placeHolder"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        NSLog(@"receivedSize = %ld", receivedSize);
        NSLog(@"expectedSize = %ld", expectedSize);
        NSLog(@"targetURL = %@", targetURL);
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"image = %@", image);
        NSLog(@"error = %@", error);
        NSLog(@"cacheType = %zd", cacheType);
        NSLog(@"imageURL = %@", imageURL);
    }];
    
    // 方法：根据一个 url 给一个 UIImageView 视图下载并设置图片
    // URL：图片资源地址
    // placeholderImage：占位图片
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:a.icon] placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    
    return cell;
}

#pragma mark - getter

- (NSArray *)apps
{
    if (!_apps)
    {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in dictArray)
        {
            [array addObject:[App appsWithDictionary:dict]];
        }
        
        _apps = array;
    }
    
    return _apps;
}

@end
