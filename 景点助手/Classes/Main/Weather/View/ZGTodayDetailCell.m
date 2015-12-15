//
//  ZGTodayDetailCell.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGTodayDetailCell.h"
#import "ZGWeatherModel.h"

@interface ZGTodayDetailCell ()

@property (strong, nonatomic) UILabel *windNameLabel;   //风向
@property (strong, nonatomic) UILabel *windContentLabel;    //风向内容
@property (strong, nonatomic) UILabel *feelNameLabel;   //体感
@property (strong, nonatomic) UILabel *feelContentLabel;    //体感内容
@property (strong, nonatomic) UILabel *washNameLabel;   //洗浴
@property (strong, nonatomic) UILabel *washContentLabel;    //洗浴内容
@property (strong, nonatomic) UILabel *dryingNameLabel;     //驾车
@property (strong, nonatomic) UILabel *dryingContentLabel;     //驾车内容
@property (strong, nonatomic) UILabel *travelNameLabel;     //旅行
@property (strong, nonatomic) UILabel *travelContentLabel;     //旅行内容
@property (strong, nonatomic) UILabel *exerciseNameLabel;     //锻炼
@property (strong, nonatomic) UILabel *exerciseContentLabel;     //锻炼内容

@end

@implementation ZGTodayDetailCell

- (instancetype)initWithWeather:(ZGWeatherModel *)weather {
    self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        self.windContentLabel.text = weather.wind;
        self.feelContentLabel.text = weather.feel;
        self.washContentLabel.text = weather.wash;
        self.dryingContentLabel.text = weather.drying;
        self.travelContentLabel.text = weather.travel;
        self.exerciseContentLabel.text = weather.exercise;
    }
    return self;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildView];
    }
    return self;
}

- (void)buildView {
    
    _windNameLabel = [[UILabel alloc]init];
    _windNameLabel.text = @"分向:";
    _windNameLabel.textAlignment = NSTextAlignmentRight;
    _windNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_windNameLabel];
    
    _windContentLabel = [[UILabel alloc]init];
    _windContentLabel.textAlignment = NSTextAlignmentLeft;
    _windContentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_windContentLabel];
    
    _feelNameLabel = [[UILabel alloc]init];
    _feelNameLabel.text = @"体感:";
    _feelNameLabel.textAlignment = NSTextAlignmentRight;
    _feelNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_feelNameLabel];
    
    _feelContentLabel = [[UILabel alloc]init];
    _feelContentLabel.textAlignment = NSTextAlignmentLeft;
    _feelContentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_feelContentLabel];
    
    _washNameLabel = [[UILabel alloc]init];
    _washNameLabel.text = @"洗浴建议:";
    _washNameLabel.textAlignment = NSTextAlignmentRight;
    _washNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_washNameLabel];
    
    _washContentLabel = [[UILabel alloc]init];
    _washContentLabel.textAlignment = NSTextAlignmentLeft;
    _washContentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_washContentLabel];
    
    _dryingNameLabel = [[UILabel alloc]init];
    _dryingNameLabel.text = @"驾车建议:";
    _dryingNameLabel.textAlignment = NSTextAlignmentRight;
    _dryingNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_dryingNameLabel];
    
    _dryingContentLabel = [[UILabel alloc]init];
    _dryingContentLabel.textAlignment = NSTextAlignmentLeft;
    _dryingContentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_dryingContentLabel];
    
    _travelNameLabel = [[UILabel alloc]init];
    _travelNameLabel.text = @"出游建议:";
    _travelNameLabel.textAlignment = NSTextAlignmentRight;
    _travelNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_travelNameLabel];
    
    _travelContentLabel = [[UILabel alloc]init];
    _travelContentLabel.textAlignment = NSTextAlignmentLeft;
    _travelContentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_travelContentLabel];

    _exerciseNameLabel = [[UILabel alloc]init];
    _exerciseNameLabel.text = @"锻炼建议:";
    _exerciseNameLabel.textAlignment = NSTextAlignmentRight;
    _exerciseNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_exerciseNameLabel];
    
    _exerciseContentLabel = [[UILabel alloc]init];
    _exerciseContentLabel.textAlignment = NSTextAlignmentLeft;
    _exerciseContentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_exerciseContentLabel];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_windNameLabel, _windContentLabel, _feelContentLabel, _feelNameLabel, _washNameLabel, _washContentLabel,  _dryingNameLabel, _dryingContentLabel, _travelContentLabel, _travelNameLabel, _exerciseContentLabel, _exerciseNameLabel);
    NSDictionary *widthDict = @{@"width":[NSNumber numberWithInt:25]};
    
    //添加纵向约束
    NSString *vVFL1 = @"V:|-5-[_windNameLabel(==_feelNameLabel)]-0-[_feelNameLabel(==_washNameLabel)]-0-[_washNameLabel(==_dryingNameLabel)]-0-[_dryingNameLabel(==_travelNameLabel)]-0-[_travelNameLabel(==_exerciseNameLabel)]-0-[_exerciseNameLabel]-5-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:widthDict views:viewsDict];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-5-[_windContentLabel(==_feelContentLabel)]-0-[_feelContentLabel(==_washContentLabel)]-0-[_washContentLabel(==_dryingContentLabel)]-0-[_dryingContentLabel(==_travelContentLabel)]-0-[_travelContentLabel(==_exerciseContentLabel)]-0-[_exerciseContentLabel]-5-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:widthDict views:viewsDict];
    [self addConstraints:vCons2];

    
    //添加横向约束
    NSString *hVFL1 = @"|-5-[_windNameLabel(==_windContentLabel)]-(width)-[_windContentLabel]-5-|";
    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:widthDict views:viewsDict];
    [self addConstraints:hCons1];
    
    NSString *hVFL2 = @"|-5-[_feelNameLabel(==_feelContentLabel)]-(width)-[_feelContentLabel]-5-|";
    NSArray *hCons2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:widthDict views:viewsDict];
    [self addConstraints:hCons2];

    NSString *hVFL3 = @"|-5-[_washNameLabel(==_washContentLabel)]-(width)-[_washContentLabel]-5-|";
    NSArray *hCons3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL3 options:0 metrics:widthDict views:viewsDict];
    [self addConstraints:hCons3];

    NSString *hVFL4 = @"|-5-[_dryingNameLabel(==_dryingContentLabel)]-(width)-[_dryingContentLabel]-5-|";
    NSArray *hCons4 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL4 options:0 metrics:widthDict views:viewsDict];
    [self addConstraints:hCons4];

    NSString *hVFL5 = @"|-5-[_travelNameLabel(==_travelContentLabel)]-(width)-[_travelContentLabel]-5-|";
    NSArray *hCons5 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL5 options:0 metrics:widthDict views:viewsDict];
    [self addConstraints:hCons5];

    NSString *hVFL6 = @"|-5-[_exerciseNameLabel(==_exerciseContentLabel)]-(width)-[_exerciseContentLabel]-5-|";
    NSArray *hCons6 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL6 options:0 metrics:widthDict views:viewsDict];
    [self addConstraints:hCons6];

    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
