//
//  ZGHomeMenuView.m
//  景点助手
//
//  Created by ZZG on 15/12/17.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHomeMenuView.h"
#import "ZGButton.h"

@interface ZGHomeMenuView ()

@property (strong, nonatomic) ZGButton *scenicButton;
@property (strong, nonatomic) ZGButton *hotelButton;
@property (strong, nonatomic) ZGButton *collectButton;
@property (strong, nonatomic) ZGButton *settingButton;


@property (strong, nonatomic) ZGButton *selectButton;   //当前选中的Button

@end

@implementation ZGHomeMenuView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildView];
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}


- (void)buildView {
    
    UIImage *bgImage = [UIImage imageNamed:@"bar_backgroundImage_deselect"];
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    
    NSString *city =  [defaults objectForKey:@"cityName"];
     _cityButton = [[ZGButton alloc]init];
    _cityButton.translatesAutoresizingMaskIntoConstraints = NO;
    _cityButton.tag = ZGHomeMenuViewButtonCity;
    [_cityButton setImage:[UIImage imageNamed:@"home_cityButton_deselect.png"] forState:UIControlStateNormal];
    [_cityButton setImage:[UIImage imageNamed:@"home_cityButton_select.png"] forState:UIControlStateSelected];
    [_cityButton setTitle:[NSString stringWithFormat:@"\t%@", city] forState:UIControlStateNormal];
    [_cityButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateSelected];
    [_cityButton addTarget:self action:@selector(clickHomeMenuViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cityButton];
    
    _scenicButton = [[ZGButton alloc]init];
    _scenicButton.translatesAutoresizingMaskIntoConstraints = NO;
    _scenicButton.tag = ZGHomeMenuViewButtonScenic;
    [_scenicButton setImage:[UIImage imageNamed:@"home_scenicButton_deselect.png"] forState:UIControlStateNormal];
    [_scenicButton setImage:[UIImage imageNamed:@"home_scenicButton_select.png"] forState:UIControlStateSelected];
    [_scenicButton setTitle:@"\t景点" forState:UIControlStateNormal];
    [_scenicButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateSelected];
    [_scenicButton addTarget:self action:@selector(clickHomeMenuViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_scenicButton];
    
    _hotelButton = [[ZGButton alloc]init];
    _hotelButton.translatesAutoresizingMaskIntoConstraints = NO;
    _hotelButton.tag = ZGHomeMenuViewButtonHotel;
    [_hotelButton setImage:[UIImage imageNamed:@"home_hotelButton_deselect.png"] forState:UIControlStateNormal];
    [_hotelButton setImage:[UIImage imageNamed:@"home_hotelButton_select.png"] forState:UIControlStateSelected];
    [_hotelButton setTitle:@"\t酒店" forState:UIControlStateNormal];
    [_hotelButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateSelected];
    [_hotelButton addTarget:self action:@selector(clickHomeMenuViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_hotelButton];
    
    _collectButton = [[ZGButton alloc]init];
    _collectButton.translatesAutoresizingMaskIntoConstraints = NO;
    _collectButton.tag = ZGHomeMenuViewButtonCollect;
    [_collectButton setImage:[UIImage imageNamed:@"home_collectButton_deselect.png"] forState:UIControlStateNormal];
    [_collectButton setImage:[UIImage imageNamed:@"home_collectButton_select.png"] forState:UIControlStateSelected];
    [_collectButton setTitle:@"\t收藏" forState:UIControlStateNormal];
    [_collectButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateSelected];
    [_collectButton addTarget:self action:@selector(clickHomeMenuViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_collectButton];
    
    _settingButton = [[ZGButton alloc]init];
    _settingButton.translatesAutoresizingMaskIntoConstraints = NO;
    _settingButton.tag = ZGHomeMenuViewButtonSetting;
    [_settingButton setImage:[UIImage imageNamed:@"home_setButton_deselect.png"] forState:UIControlStateNormal];
    [_settingButton setImage:[UIImage imageNamed:@"home_setButton_select.png"] forState:UIControlStateSelected];
    [_settingButton setTitle:@"\t设置" forState:UIControlStateNormal];
    [_settingButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateSelected];
    [_settingButton addTarget:self action:@selector(clickHomeMenuViewButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_settingButton];
    
//    [_settingButton setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8]];
    
//        [_collectButton setBackgroundColor:[UIColor blackColor]];
    
    _scenicButton.selected = YES;
    self.selectButton = _scenicButton;
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_cityButton, _scenicButton, _hotelButton, _collectButton, _settingButton);
    NSDictionary *distancesDict = @{@"buttonDistance":[NSNumber numberWithFloat:40], @"buttonHeight":[NSNumber numberWithFloat: 40.0], @"borderHeightDistance":[NSNumber numberWithFloat:self.frame.size.height * 1 / 8.0], @"boderWidthDistance":[NSNumber numberWithFloat:5.0]};
    
    NSString *vVFL = @"V:|-borderHeightDistance-[_cityButton(buttonHeight)]-buttonDistance-[_scenicButton(buttonHeight)]-buttonDistance-[_hotelButton(buttonHeight)]-buttonDistance-[_collectButton(buttonHeight)]-buttonDistance-[_settingButton(buttonHeight)]";
    NSArray *vCons= [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons];
    
    NSString *hVFL1 = @"H:|-boderWidthDistance-[_cityButton]-boderWidthDistance-|";
    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons1];
    
    NSString *hVFL2 = @"H:|-boderWidthDistance-[_scenicButton]-boderWidthDistance-|";
    NSArray *hCons2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons2];

    NSString *hVFL3 = @"H:|-boderWidthDistance-[_hotelButton]-boderWidthDistance-|";
    NSArray *hCons3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL3 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons3];

    NSString *hVFL4 = @"H:|-boderWidthDistance-[_collectButton]-boderWidthDistance-|";
    NSArray *hCons4 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL4 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons4];

    NSString *hVFL5 = @"H:|-boderWidthDistance-[_settingButton]-boderWidthDistance-|";
    NSArray *hCons5 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL5 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons5];
}

- (void)clickHomeMenuViewButton:(ZGButton *)sender {
//     sender.selected = !sender.selected;
    
    self.selectButton.selected = NO;
//    [self.selectButton setBackgroundColor:[UIColor clearColor]];
    
    [self.delegate homeMenuViewButtonClcikFrom:_selectButton.tag to:sender.tag];
    
    self.selectButton = sender;
    
    self.selectButton.selected = YES;
//    [self.selectButton setBackgroundColor:[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:0.8]];
}


- (void)cityChanged {
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    
    NSString *city =  [defaults objectForKey:@"cityName"];
    [_cityButton setTitle:[NSString stringWithFormat:@"\t%@", city] forState:UIControlStateNormal];
}

@end
