//
//  ZGDetailCell.h
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 景点的详细信息列表
 展示景点内单个小景点信息
 */

#import <UIKit/UIKit.h>
@class ZGScenicDetail;

@interface ZGDetailCell : UITableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView scenicDetail:(ZGScenicDetail *)detail;

+ (CGFloat)heightForCellWidthScenicDetail:(ZGScenicDetail *)detail width:(CGFloat)width;
@end
