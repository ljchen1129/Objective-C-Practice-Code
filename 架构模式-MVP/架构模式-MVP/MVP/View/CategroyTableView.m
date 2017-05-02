//
//  CategroyTableView.m
//  架构模式-MVP
//
//  Created by 陈良静 on 2017/4/27.
//  Copyright © 2017年 陈良静. All rights reserved.
//

#import "CategroyTableView.h"
#import "CategoryModel.h"

@interface CategroyTableView () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation CategroyTableView

- (void)awakeFromNib
{
    self.dataSource = self;
    self.delegate = self;
    self.backgroundColor = [UIColor redColor];
    
    [super awakeFromNib];
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
    }
    
    CategoryModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld", model.count];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - setter

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self reloadData];
}

@end
