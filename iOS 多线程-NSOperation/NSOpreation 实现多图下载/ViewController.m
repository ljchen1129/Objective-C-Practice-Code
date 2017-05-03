//
//  ViewController.m
//  NSOpreation 实现多图下载
//
//  Created by 陈良静 on 2017/5/2.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "ViewController.h"
#import "App.h"

@interface ViewController () <UITableViewDataSource, UITabBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) NSArray *apps;

/// 缓存图片字典
@property(nonatomic, strong) NSMutableDictionary *imageCache;

///
@property(nonatomic, strong) NSOperationQueue *queue;

/// operationCache
@property(nonatomic, strong) NSMutableDictionary *operationCache;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    // 清除所有内存缓存
    [self.imageCache removeAllObjects];
    
    // 取消所有正在进行的操作
    [self.queue cancelAllOperations];
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
    
    // 从内存中取出图片
    UIImage *image = self.imageCache[a.icon];
    if (image)
    {
        // 内存中有图片
        cell.imageView.image = image;
    }
    else
    {
        // 从沙盒中获取图片数据
        // 获取 Caches 的目录
        NSString *cachesPath =  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        // 获取文件名
        NSString *fileName = [a.icon lastPathComponent];
        // 计算文件的全路径
        NSString *file = [cachesPath stringByAppendingPathComponent:fileName];
        // 加载沙盒中文件数据
        NSData *data = [NSData dataWithContentsOfFile:file];
        if (data)
        {   // 沙盒中有图片
            UIImage *imageCache = [UIImage imageWithData:data];
            cell.imageView.image = imageCache;
    
            // 注意8：从沙盒中加载图片数据后，需要将图片缓存到内存字典中
            self.imageCache[a.icon] = cell.imageView.image;
        }
        else
        {
            NSOperation *op = self.operationCache[a.icon];
            // 注意2：下载未完成之前，显示占位图片
            cell.imageView.image = [UIImage imageNamed:@"placeHolder"];
            if (op == nil)
            {
                op = [NSBlockOperation blockOperationWithBlock:^{
                    // 下载图片
                    NSLog(@"下载图片");
                    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:a.icon]];
                    // 注意4：当下载失败时，需要移除下载操作，并且直接返回
                    if (data == nil)
                    {
                        [self.operationCache removeObjectForKey:a.icon];
                        return;
                    }
                    
                    UIImage *downLoadImage = [UIImage imageWithData:data];
                    
                    // 注意7：图片下载完成后，需要将图片数据缓存到内存以及沙盒中
                    // 保存到内存字典中
                    self.imageCache[a.icon] = downLoadImage;
                    
                    /* 沙盒目录
                     Documents:在 itnues 连接时会备份到苹果服务器
                     Library
                     - Caches:
                     - Preference: 偏好设置
                     tmp: 临时文件，随时会被清理
                     */
                    
                    // 将图片文件数据写入沙盒中
                    [data writeToFile:file atomically:YES];

                    // 回到主线程刷新 UI
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        
                        // 注意3：直接给 cell 设置图片在滑动 tableView 的时候会出现错误，因为如果图片还没有下载完成，就已经滑动了，当图片下载完成时要显示的 cell 已经不是当时的 cell 了
//                        cell.imageView.image = image;
                        
                        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                    }];
                    
                    // 注意5：下载完成后，移除下载操作
                    [self.operationCache removeObjectForKey:a.icon];
                }];
                
                // 注意6：将下载图片操作添加到队列中，下载完成无须将操作从队列中移除，队列会自动移除下载完成的操作
                [self.queue addOperation:op];
                
                // 注意1：将下载图片的操作缓存到字典中，避免重复多次下载操作
                self.operationCache[a.icon] = op;
            }
        }
    }
    
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

- (NSMutableDictionary *)imageCache
{
    if (!_imageCache)
    {
        _imageCache = [[NSMutableDictionary alloc] initWithCapacity:10];
    }
    
    return _imageCache;
}

- (NSOperationQueue *)queue
{
    if (!_queue)
    {
        _queue = [[NSOperationQueue alloc] init];
        // 设置最大并发数
        _queue.maxConcurrentOperationCount = 3;
    }
    
    return _queue;
}

@end
