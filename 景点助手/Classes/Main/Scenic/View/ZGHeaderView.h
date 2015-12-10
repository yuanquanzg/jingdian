//
//  ZGHeaderView.h
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 DetailTableControll的第二个Section的headerView
 */

#import <UIKit/UIKit.h>

@protocol ZGHeaderViewDelegate <NSObject>

- (void)clickHeaderButton:(UIButton *)btn;

@end

@interface ZGHeaderView : UIView

@property (weak, nonatomic) id<ZGHeaderViewDelegate> delegate;

@end
