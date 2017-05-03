//
//  ViewController.m
//  SDWebImage 基本使用
//
//  Created by 陈良静 on 2017/5/3.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import <SDWebImageDownloader.h>
#import <FLAnimatedImage.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FLAnimatedImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setupGifImage];
}

// 给 UIImageView 下载设置图片
- (void)download1
{
    // 给 UIImageView 视图下载并设置图片
    // 参数一 URL：图片资源路径
    // 参数二 placeholderImage ：占位图片
    // 参数三 options ：选择枚举，图片下载选项操作
    // 参数四 progress： 图片下载过程进度回调（receivedSize ： 已下载的图片数据大小，expectedSize：图片真实的数据大小，targetURL：图片资源目标路径）
    // 参数五 completed：图片下载完毕回调（image ：图片，error：错误信息，cacheType：枚举，缓存类型，imageURL：图片目标路径）
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://image.tianjimedia.com/uploadImages/2015/162/22/4GU4301NQGWW.jpg"] placeholderImage:[UIImage imageNamed:@"placeHolder"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        
    }];
}

// 获取下载的图片，不进行设置（内存&磁盘缓存）
- (void)download2
{
    [[SDWebImageManager sharedManager] loadImageWithURL:[NSURL URLWithString:@"http://image.tianjimedia.com/uploadImages/2015/162/22/4GU4301NQGWW.jpg"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL * _Nullable imageURL) {
        self.imageView.image = image;
    }];
}

// 不做内存以及磁盘缓存
// 没有做任何缓存处理
- (void)download3
{
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:@"http://p.3761.com/pic/20131413167658.jpg"] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        // 注意：这里是在子线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
        }];
    }];
}


// 设置动态 gif 图片
- (void)setupGifImage
{
    NSData *data = [NSData dataWithContentsOfFile:@"/Users/chenliangjing/Downloads/23b8c47499b23d19c7129085b9e2aca7.gif"];
    self.imageView.animatedImage = [FLAnimatedImage animatedImageWithGIFData:data];
}

@end
