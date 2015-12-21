//
//  ZGHomeMenuView.h
//  景点助手
//
//  Created by ZZG on 15/12/17.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  ZGButton;

typedef NS_ENUM(NSInteger, ZGHomeMenuViewButtonType) {
    ZGHomeMenuViewButtonCity = 0,
    ZGHomeMenuViewButtonScenic,
    ZGHomeMenuViewButtonHotel,
    ZGHomeMenuViewButtonCollect,
    ZGHomeMenuViewButtonSetting
};

@protocol ZGHomeMenuViewDelegate <NSObject>

//左边按钮被点击时调用
- (void)homeMenuViewButtonClcikFrom:(ZGHomeMenuViewButtonType)fromIndex to:(ZGHomeMenuViewButtonType)toIndex;

@end

@interface ZGHomeMenuView : UIView

@property (strong, nonatomic) ZGButton *cityButton;

@property (weak, nonatomic) id<ZGHomeMenuViewDelegate> delegate;

- (void)cityChanged;

@end
