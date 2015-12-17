//
//  ZGHotelDetailCell.h
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 此cell位于酒店详情页头部图片下面
 主要有两个Button 一个拨打电话，一个进入酒店详细介绍
 */

#import <UIKit/UIKit.h>
@class ZGHotelDetail;

typedef NS_ENUM(NSInteger, ZGHotelDetailCellButtonTag) {
    ZGHotelDetailCellButtonphone,          // phoneButton
    ZGHotelDetailCellButtonIntro,        // introButton
};

@protocol ZGHotelDetailCellDelegate <NSObject>

- (void)clickHotelDetailCellButton:(UIButton *)btn;

@end

@interface ZGHotelDetailCell : UITableViewCell

@property (weak, nonatomic) id<ZGHotelDetailCellDelegate> delegate;

+ (instancetype)initWithTableView:(UITableView *)tableView hotelDetail:(ZGHotelDetail *)hotelDetail hotelName:(NSString *)hotelName;

@end
