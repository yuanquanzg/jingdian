//
//  ZGHotelDetailCell.h
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

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
