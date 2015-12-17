//
//  ZGHotelHeaderView.h
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 房间信息的大分类，放置于每个section 的headerView中，点击此view可展开房间详细
 */

#import <UIKit/UIKit.h>
@class ZGRoomModel;

@protocol ZGHotelHeaderViewDelegate <NSObject>

- (void)clickHotelHeaderView:(NSInteger)section;

@end

@interface ZGHotelHeaderView : UIView

@property (weak, nonatomic) id<ZGHotelHeaderViewDelegate> delegate;

- (instancetype)initWithRoomModel:(ZGRoomModel *)roomModel section:(NSInteger)section;

@end
