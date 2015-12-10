//
//  ZGHeaderView.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHeaderView.h"

@interface ZGHeaderView ()

@property (strong, nonatomic) UIButton *weatherBtn;
@property (strong, nonatomic) UIButton *priceBtn;
@property (strong, nonatomic) UIButton *trafficBtn;

@end

@implementation ZGHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildView];
    }
    return self;
}

- (void)buildView {
    
    _priceBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_priceBtn setTag:1];
    [_priceBtn setTitle:@"票价" forState:UIControlStateNormal];
    [_priceBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_priceBtn];
   
    _trafficBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_trafficBtn setTag:2];
    [_trafficBtn setTitle:@"交通" forState:UIControlStateNormal];
    [_trafficBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_trafficBtn];

    _weatherBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_weatherBtn setTag:3];
    [_weatherBtn setTitle:@"天气" forState:UIControlStateNormal];
    [_weatherBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_weatherBtn];
    
    [_priceBtn setBackgroundColor:[UIColor redColor]];

}

- (void)clickButton:(UIButton *)btn {
    [self.delegate clickHeaderButton:btn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _weatherBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _trafficBtn.translatesAutoresizingMaskIntoConstraints = NO;
    _priceBtn.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_weatherBtn, _trafficBtn, _priceBtn);
    NSString *hVFL = @"H:|-0-[_priceBtn(==_trafficBtn)]-1-[_trafficBtn(==_weatherBtn)]-1-[_weatherBtn]-0-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:@{@"height":@(self.frame.size.width)} views:viewsDictionary];
    [self addConstraints:hCons];
   
}
@end
