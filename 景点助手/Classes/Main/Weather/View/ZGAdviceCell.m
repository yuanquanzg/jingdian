//
//  ZGAdviceCell.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGAdviceCell.h"
#import "ZGWeatherModel.h"
#import "ZGDetailLabel.h"

@interface ZGAdviceCell ()

@property (strong, nonatomic) ZGDetailLabel *adviceLabel;

@end

@implementation ZGAdviceCell



- (instancetype)initWithWeather:(ZGWeatherModel *)weather {
    self = [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (self) {
        self.adviceLabel.text = weather.dress;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildView];
    }
    return self;
}

- (void)buildView {
    
    _adviceLabel = [[ZGDetailLabel alloc]init];
    _adviceLabel.numberOfLines = 0;
    _adviceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_adviceLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewDict = NSDictionaryOfVariableBindings(_adviceLabel);
    
    NSString *vVFL = @"V:|-0-[_adviceLabel]-0-|";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:viewDict];
    [self addConstraints:vCons];
    
    NSString *hVFL = @"H:|-5-[_adviceLabel]-5-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:viewDict];
    [self addConstraints:hCons];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
