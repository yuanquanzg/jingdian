//
//  ZGRoomListCell.h
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGRoomDetail;

@interface ZGRoomListCell : UITableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView RoomDetail:(ZGRoomDetail *)roomDetail;


//获得Cell高度
+ (CGFloat)heightWithRoomDetail:(ZGRoomDetail *)roomDetail width:(CGFloat)width;

@end
