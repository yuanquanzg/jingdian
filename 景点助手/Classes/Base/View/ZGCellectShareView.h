//
//  ZGBottomView.h
//  景点助手
//
//  Created by ZZG on 15/12/11.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 ZGScenicDetailTableController与ZGHotelDetailController的收藏与分享按钮的View
 并对其操作做处理
 */

#import <UIKit/UIKit.h>
@class ZGCollectionModel;

@protocol ZGCellectShareViewDelegate <NSObject>

- (void)clickShareButton:(UIButton *)btn;

@end

@interface ZGCellectShareView : UIView

@property (weak, nonatomic) id<ZGCellectShareViewDelegate> delegate;

- (instancetype)initWithCollectionModel:(ZGCollectionModel *)model fileName:(NSString *)fileName;

@end
