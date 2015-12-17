//
//  ZGHotelListCell.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 酒店列表
 */

#import <UIKit/UIKit.h>
@class ZGHotelModel;

@interface ZGHotelListCell : UITableViewCell

//- (instancetype)initWithHotel:(ZGHotelModel *)hotel;

+ (instancetype)initWithTableView:(UITableView *)tableView priceModel:(ZGHotelModel *)hotel;

@end
