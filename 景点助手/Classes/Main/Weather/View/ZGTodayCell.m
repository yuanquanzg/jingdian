//
//  ZGTodayCell.m
//  景点助手
//
//  Created by ZZG on 15/12/13.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGTodayCell.h"
#import "ZGWeatherModel.h"

@interface ZGTodayCell ()

@property (strong, nonatomic) UILabel *tempNowLabel;   //实时温度Label
@property (strong, nonatomic) UILabel *tempLabel;   //温差Label
@property (strong, nonatomic) UILabel *weekLabel;   //星期Label
@property (strong, nonatomic) UILabel *dateLabel;   //日期Label
@property (strong, nonatomic) UILabel *weatherLabel;    //天气Label

@end


@implementation ZGTodayCell

- (instancetype)initWithWeather:(ZGWeatherModel *)weather {
    self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        self.tempLabel.text = weather.temp;
        self.tempNowLabel.text = [NSString stringWithFormat:@"%@", weather.tempNow];
        self.weekLabel.text = weather.week;
        self.weatherLabel.text = weather.weather;
        self.dateLabel.text = weather.date;
    }
    return self;
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)buildView {
    _tempLabel = [[UILabel alloc]init];
    _tempLabel.textAlignment = NSTextAlignmentCenter;
    _tempLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_tempLabel setBackgroundColor:[UIColor clearColor]];
    [_tempLabel setTextColor:[UIColor whiteColor]];
    [self addSubview:_tempLabel];
    
    _tempNowLabel = [[UILabel alloc]init];
    [_tempNowLabel setBackgroundColor:[UIColor clearColor]];
    [_tempNowLabel setTextColor:[UIColor whiteColor]];
    _tempNowLabel.textAlignment = NSTextAlignmentCenter;
    [_tempNowLabel setFont:[UIFont systemFontOfSize:60]];
    _tempNowLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_tempNowLabel];
    
    _weatherLabel = [[UILabel alloc]init];
    [_weatherLabel setBackgroundColor:[UIColor clearColor]];
    [_weatherLabel setTextColor:[UIColor whiteColor]];
    _weatherLabel.textAlignment = NSTextAlignmentCenter;
    _weatherLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_weatherLabel];
    
    _weekLabel = [[UILabel alloc]init];
    [_weekLabel setBackgroundColor:[UIColor clearColor]];
    [_weekLabel setTextColor:[UIColor whiteColor]];
    _weekLabel.textAlignment = NSTextAlignmentCenter;
    _weekLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_weekLabel];
    
    _dateLabel = [[UILabel alloc]init];
    [_dateLabel setBackgroundColor:[UIColor clearColor]];
    [_dateLabel setTextColor:[UIColor whiteColor]];
    _dateLabel.textAlignment = NSTextAlignmentCenter;
    _dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_dateLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_dateLabel, _weekLabel, _tempNowLabel, _tempLabel, _weatherLabel);
    NSDictionary *viewsHeight = @{@"tempNowLabelHeight":[NSNumber numberWithFloat:(3 / 5.0 * self.frame.size.height)], @"otherHeight": [NSNumber numberWithFloat:(1 / 5.0 * self.frame.size.height)]};
   
    //添加纵向约束
    NSString *vVFL1 = @"V:|-0-[_weatherLabel(otherHeight)]-0-[_tempNowLabel(tempNowLabelHeight)]-0-[_weekLabel(otherHeight)]-0-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:viewsHeight views:viewsDict];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:[_tempNowLabel]-0-[_dateLabel]-0-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:viewsHeight views:viewsDict];
    [self addConstraints:vCons2];
    
    NSString *vVFL3 = @"V:[_tempNowLabel]-0-[_tempLabel]-0-|";
    NSArray *vCons3 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL3 options:0 metrics:viewsHeight views:viewsDict];
    [self addConstraints:vCons3];
    
    //添加横向约束
    NSString *hVFL1 = @"H:|-0-[_weatherLabel]-0-|";
    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:nil views:viewsDict];
    [self addConstraints:hCons1];
    
    NSString *hVFL2 = @"H:|-0-[_tempNowLabel]-0-|";
    NSArray *hCons2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:nil views:viewsDict];
    [self addConstraints:hCons2];
    
    NSString *hVFL3 = @"H:|-5-[_weekLabel(==_tempLabel)]-5-[_dateLabel(180)]-5-[_tempLabel]-5-|";
    NSArray *hCons3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL3 options:0 metrics:nil views:viewsDict];
    [self addConstraints:hCons3];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
