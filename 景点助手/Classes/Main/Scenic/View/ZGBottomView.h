//
//  ZGBottomView.h
//  景点助手
//
//  Created by ZZG on 15/12/11.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZGBottomViewDelegate <NSObject>

- (void)clickShareButton:(UIButton *)btn;

@end

@interface ZGBottomView : UIView

@property (weak, nonatomic) id<ZGBottomViewDelegate> delegate;

@end
