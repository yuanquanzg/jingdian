//
//  ZGFutureCell.m
//  景点助手
//
//  Created by ZZG on 15/12/13.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGFutureCell.h"
#import "ZGWeatherModel.h"

@interface ZGFutureCell ()

@property (strong, nonatomic) UILabel *weekLabel;   //星期Label
@property (strong, nonatomic) UILabel *weatherLabel;    //天气Label
@property (strong, nonatomic) UILabel *tempLabel;   //温度Label

@end

@implementation ZGFutureCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildView];
    }
    return self;
}

- (instancetype)initWithWeather:(ZGWeatherModel *)weather {
    self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        self.weekLabel.text = weather.week;
        self.weatherLabel.text = weather.weather;
        self.tempLabel.text = weather.temp;
    }
    return  self;
}

- (void)buildView {
    _tempLabel = [[UILabel alloc]init];
    _tempLabel.textAlignment = NSTextAlignmentCenter;
    _tempLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_tempLabel];
    
    _weekLabel = [[UILabel alloc]init];
    _weekLabel.textAlignment = NSTextAlignmentCenter;
    _weekLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_weekLabel];
    
    _weatherLabel = [[UILabel alloc]init];
    _weatherLabel.textAlignment = NSTextAlignmentCenter;
    _weatherLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_weatherLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_weatherLabel, _weekLabel, _tempLabel);
    
    NSString *vVFL1 = @"V:|-0-[_weatherLabel]-0-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:nil views:viewsDict];;
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-0-[_weekLabel]-0-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:nil views:viewsDict];;
    [self addConstraints:vCons2];

    NSString *vVFL3 = @"V:|-0-[_tempLabel]-0-|";
    NSArray *vCons3 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL3 options:0 metrics:nil views:viewsDict];;
    [self addConstraints:vCons3];

    NSString *hVFL = @"H:|-5-[_weekLabel(==_tempLabel)]-5-[_weatherLabel(180)]-5-[_tempLabel]-5-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:viewsDict];;
    [self addConstraints:hCons];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
