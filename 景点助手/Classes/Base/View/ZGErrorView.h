//
//  ZGErrorView.h
//  景点助手
//
//  Created by ZZG on 16/4/8.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, ZGErrorViewType) {
    ZGErrorViewNetworkError,
    ZGErrorViewDataError
};

@interface ZGErrorView : UIView

- (void)showErrorViewWithType:(ZGErrorViewType)type;

@end
