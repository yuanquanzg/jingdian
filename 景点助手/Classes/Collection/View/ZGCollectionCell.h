//
//  ZGCollectionCell.h
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 展示收藏的景点和酒店的Cell
 */


#import <UIKit/UIKit.h>
@class ZGCollectionModel;

@interface ZGCollectionCell : UITableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView collectionModel:(ZGCollectionModel *)model;

@end
