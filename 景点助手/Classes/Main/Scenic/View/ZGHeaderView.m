//
//  ZGHeaderView.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHeaderView.h"
#import "ZGButton.h"

@interface ZGHeaderView ()

@property (strong, nonatomic) ZGButton *weatherBtn;
@property (strong, nonatomic) ZGButton *priceBtn;
@property (strong, nonatomic) ZGButton *trafficBtn;

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
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowRadius = 0.2;
    self.clipsToBounds = NO;
    
    self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:0.8];
    UIImage *bgImage = [UIImage imageNamed:@"bar_backgroundImage_deselect"];
    
    _priceBtn = [ZGButton buttonWithType:UIButtonTypeRoundedRect];
    [_priceBtn setBackgroundColor:[UIColor whiteColor]];
    [_priceBtn setTag:ZGScenicDetailHeaderViewButtonPrice];
    [_priceBtn setTitle:@"票价" forState:UIControlStateNormal];
    [_priceBtn setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
    [_priceBtn setImage:[[UIImage imageNamed:@"detail_price_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_priceBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_priceBtn];
   
    _trafficBtn = [ZGButton buttonWithType:UIButtonTypeRoundedRect];
    [_trafficBtn setBackgroundColor:[UIColor whiteColor]];
    [_trafficBtn setTag:ZGScenicDetailHeaderViewButtonTraffic];
    [_trafficBtn setTitle:@"地图" forState:UIControlStateNormal];
    [_trafficBtn setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
    [_trafficBtn setImage:[[UIImage imageNamed:@"detail_traffic_deselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_trafficBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_trafficBtn];

    _weatherBtn = [ZGButton buttonWithType:UIButtonTypeRoundedRect];
    [_weatherBtn setBackgroundColor:[UIColor whiteColor]];
    [_weatherBtn setTag:ZGScenicDetailHeaderViewButtonWeather];
    [_weatherBtn setTitle:@"天气" forState:UIControlStateNormal];
    [_weatherBtn setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
    [_weatherBtn setImage:[[UIImage imageNamed:@"detail_weather_deselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_weatherBtn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_weatherBtn];
    
//    [_priceBtn setBackgroundColor:[UIColor redColor]];
//    [_weatherBtn setBackgroundColor:[UIColor redColor]];
//    [_trafficBtn setBackgroundColor:[UIColor redColor]];

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
    
    NSString *vVFL1 = @"V:|-0-[_priceBtn(==_trafficBtn)]-1-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-0-[_trafficBtn(==_weatherBtn)]-1-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:vCons2];

   
}
@end
