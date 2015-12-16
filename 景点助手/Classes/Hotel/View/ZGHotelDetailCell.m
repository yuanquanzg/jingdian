//
//  ZGHotelDetailCell.m
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelDetailCell.h"
#import "UIImageView+ZGTool.h"
#import "ZGHotelDetail.h"
#import "ZGDetailLabel.h"
#import "ZGHeaderButton.h"

@interface ZGHotelDetailCell ()

@property (strong, nonatomic) UIImageView *hotelImageView;  //酒店图片
//@property (strong, nonatomic) UILabel *numberNameLabel;
//@property (strong, nonatomic) UILabel *numberLabel; //电话
//@property (strong, nonatomic) ZGDetailLabel *introLabel;  //简介
@property (strong, nonatomic) ZGHeaderButton *numberButton;   //拨打电话
@property (strong, nonatomic) ZGHeaderButton *introButton;    //其他信息
@property (strong, nonatomic) UILabel *hotelNameLabel;

@end

@implementation ZGHotelDetailCell


+ (instancetype)initWithTableView:(UITableView *)tableView hotelDetail:(ZGHotelDetail *)hotelDetail  hotelName:(NSString *)hotelName{
    static NSString *identifier = @"hotelDetailCell";

    ZGHotelDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ZGHotelDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell.hotelImageView loadImageWithUrl:hotelDetail.imageUrl];
    cell.hotelNameLabel.text = hotelName;
//    cell.numberNameLabel.text = @"电话号码";
//    cell.numberLabel.text = hotelDetail.phoneNumber;
//    cell.introLabel.text = hotelDetail.intro;
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.7]];
    }
     return self;
}

- (void)buildView {
    
    _hotelImageView = [[UIImageView alloc]init];
    _hotelImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_hotelImageView];
    
    _hotelNameLabel = [[UILabel alloc]init];
    _hotelNameLabel.textColor = [UIColor whiteColor];
    _hotelNameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_hotelImageView addSubview:_hotelNameLabel];
    
//    _numberButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    _numberButton.translatesAutoresizingMaskIntoConstraints = NO;
//    [_numberButton setBackgroundColor:[UIColor whiteColor]];
//    [_numberButton setTitle:@"联系电话" forState:UIControlStateNormal];
//    [_numberButton addTarget:self action:@selector(clickHotelButton:) forControlEvents:UIControlEventTouchUpInside];
//    _numberButton.tag = 1;
//    [self addSubview:_numberButton];
//    
//    _introButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [_introButton setBackgroundColor:[UIColor whiteColor]];
//    _introButton.translatesAutoresizingMaskIntoConstraints = NO;
//    [_introButton setTitle:@"其他信息" forState:UIControlStateNormal];
//    [_introButton addTarget:self action:@selector(clickHotelButton:) forControlEvents:UIControlEventTouchUpInside];
//    _introButton.tag = 2;
//    [self addSubview:_introButton];
    
    UIImage *bgImage = [UIImage imageNamed:@"bar_backgroundImage_deselect"];
    
    _numberButton = [ZGHeaderButton buttonWithType:UIButtonTypeRoundedRect];
    _numberButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_numberButton setBackgroundColor:[UIColor whiteColor]];
    [_numberButton setTag:ZGHotelDetailCellButtonphone];
    [_numberButton setTitle:@"电话" forState:UIControlStateNormal];
    [_numberButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
    [_numberButton setImage:[[UIImage imageNamed:@"hotel_phone_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_numberButton addTarget:self action:@selector(clickHotelButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_numberButton];
    
    _introButton = [ZGHeaderButton buttonWithType:UIButtonTypeRoundedRect];
    _introButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_introButton setBackgroundColor:[UIColor whiteColor]];
    [_introButton setTag:ZGHotelDetailCellButtonIntro];
    [_introButton setTitle:@"信息" forState:UIControlStateNormal];
    [_introButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
    [_introButton setImage:[[UIImage imageNamed:@"hotel_intro_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_introButton addTarget:self action:@selector(clickHotelButton:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_introButton];

    
//    [_numberButton setBackgroundColor:[UIColor redColor]];
//    [_introButton setBackgroundColor:[UIColor redColor]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    _hotelImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width / 400.0 * 300.0);
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_hotelImageView, _numberButton, _introButton, _hotelNameLabel);
    NSDictionary *distancesDict = @{@"imageViewWidth":[NSNumber numberWithFloat:self.frame.size.width], @"imageViewHeight":[NSNumber numberWithFloat:self.frame.size.width / 400.0 * 300.0 - 80]};

//    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_hotelImageView);
//    
//    NSString *vVFL1 = @"V:|-0-[_hotelImageView]-0-|";
//    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:nil views:viewsDict];
//    [self addConstraints:vCons1];
    
//    //横向约束
//    NSString *hVFL1 = @"H:|-0-[_hotelImageView]-0-|";
//    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:nil views:viewsDict];
//    [self addConstraints:hCons1];
    
    
    //纵向约束
    NSString *vVFL1 = @"V:|-0-[_hotelImageView(imageViewHeight)]-2-[_numberButton]-0-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-0-[_hotelImageView(imageViewHeight)]-2-[_introButton]-0-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons2];
    
    NSString *vVFL3 = @"V:[_hotelNameLabel(20)]-10-|";
    NSArray *vCons3 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL3 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons3];
    
    //横向约束
    NSString *hVFL1 = @"H:|-0-[_numberButton(==_introButton)]-1-[_introButton]-0-|";
    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:nil views:viewsDict];
    [self addConstraints:hCons1];
    
    NSString *hVFL2 = @"H:|-0-[_hotelImageView]-0-|";
    NSArray *hCons2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:nil views:viewsDict];
    [self addConstraints:hCons2];
    
    NSString *hVFL3 = @"H:|-10-[_hotelNameLabel]-0-|";
    NSArray *hCons3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL3 options:0 metrics:nil views:viewsDict];
    [self addConstraints:hCons3];


}

- (void)clickHotelButton:(UIButton *)btn {
    
    [self.delegate clickHotelDetailCellButton:btn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
