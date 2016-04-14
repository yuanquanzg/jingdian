//
//  ZGErrorView.m
//  景点助手
//
//  Created by ZZG on 16/4/8.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGErrorView.h"

@interface ZGErrorView ()

@property (strong, nonatomic) UIButton *refreshButton;
@property (strong, nonatomic) UIImageView *networkView;

@property (strong, nonatomic) UILabel *tipLable;

@end

@implementation ZGErrorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        [self buildView];
    }
    return self;
}

- (void)buildView {
    _refreshButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_refreshButton setBackgroundImage:[UIImage imageNamed:@"error_button_refresh"] forState:UIControlStateNormal];
    [_refreshButton setCenter:CGPointMake(self.center.x, self.center.y - 200)];
    [_refreshButton setBounds:CGRectMake(0, 0, 128, 128)];
    [_refreshButton addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    
    _networkView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"error_image_network"]];
    [_networkView setCenter:CGPointMake(self.center.x, self.center.y - 200)];
    [_networkView setBounds:CGRectMake(0, 0, 128, 128)];
    
    _tipLable = [[UILabel alloc]initWithFrame:CGRectMake(0, _networkView.frame.origin.y + 128 + 50, CGRectGetWidth(self.bounds), 30)];
    [_tipLable setTextColor:[UIColor grayColor]];
    [_tipLable setTextAlignment:NSTextAlignmentCenter];
    
}

- (void)refreshData {
    
}

- (void)showErrorViewWithType:(ZGErrorViewType)type {
    if (type == ZGErrorViewNetworkError) {
        [self addSubview:_networkView];
        [_tipLable setText:@"加载失败，请检查网络"];
        [self addSubview:_tipLable];
    } else {
        [self addSubview:_refreshButton];
        [_tipLable setText: @"加载失败，请点击重试"];
        [self addSubview:_tipLable];
    }
}


@end
