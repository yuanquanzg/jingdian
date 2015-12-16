//
//  ZGHotelHeaderView.m
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelHeaderView.h"
#import "ZGRoomModel.h"

@interface ZGHotelHeaderView ()

@property (assign, nonatomic) NSInteger section;    //房间类型的序号

@property (strong, nonatomic) UIImageView *roomImageView;   //房间图片
@property (strong, nonatomic) UILabel *nameLabel;   //房间名称
@property (strong, nonatomic) UILabel *areaLabel;    //房间面积
@property (strong, nonatomic) UILabel *bedLabel;    //床位信息

@property (assign, nonatomic) BOOL isSpread;    //是否展开

@property (strong, nonatomic) UIImageView *guideImageView;  //显示是否展开

@end

@implementation ZGHotelHeaderView

- (instancetype)initWithRoomModel:(ZGRoomModel *)roomModel section:(NSInteger)section{
    self = [super init];
    if (self) {
        //此行需放在[self buildView]之前，在buildView中需要对其值做判断，若不放在其前，isSpread的值始终为NO
        self.isSpread = roomModel.isSpread;
        [self buildView];
        self.section = section;
        self.nameLabel.text = roomModel.roomName;
        self.areaLabel.text = roomModel.area;
        self.bedLabel.text = roomModel.bed;
        self.roomImageView.image = [UIImage imageNamed:roomModel.imageName];
    }
    return self;
}


- (void)buildView {
    
//    [self setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.7]];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    _roomImageView = [[UIImageView alloc]init];
    _roomImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_roomImageView];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.numberOfLines = 0;
    _nameLabel.font = [UIFont systemFontOfSize:20.0];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_nameLabel];
    
    _areaLabel = [[UILabel alloc]init];
    _areaLabel.font = [UIFont systemFontOfSize:16.0];
    _areaLabel.textAlignment = NSTextAlignmentRight;
    _areaLabel.textColor = [UIColor redColor];
    _areaLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_areaLabel];
    
    _bedLabel = [[UILabel alloc]init];
    _bedLabel.font = [UIFont systemFontOfSize:16.0];
    _bedLabel.textColor = [UIColor grayColor];
    _bedLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_bedLabel];
    
    
    _guideImageView = [[UIImageView alloc]init];
    if (_isSpread) {
        [_guideImageView setImage:[UIImage imageNamed:@"hotel_header_down.png"]];
    }else {
        [_guideImageView setImage:[UIImage imageNamed:@"hotel_header_up.png"]];
    }
    [self addSubview:_guideImageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_roomImageView, _nameLabel, _areaLabel, _bedLabel);
    
    NSDictionary *distancesDict = @{@"sideDistance":[NSNumber numberWithFloat:10], @"labelDistance":[NSNumber numberWithFloat:2], @"nameLabelHeight":[NSNumber numberWithFloat:self.frame.size.height * 1 / 3.0], @"imageViewWidth":[NSNumber numberWithFloat:self.frame.size.height - 20]};
    
    //纵向约束
    NSString *vVFL1 = @"V:|-sideDistance-[_roomImageView]-sideDistance-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-sideDistance-[_nameLabel(nameLabelHeight)]-labelDistance-[_areaLabel(==_bedLabel)]-labelDistance-[_bedLabel]-sideDistance-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons2];
    
    //横向约束
    NSString *hVFL1 = @"H:|-sideDistance-[_roomImageView(imageViewWidth)]-sideDistance-[_nameLabel]-20-|";
    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons1];
    
    NSString *hVFL2 = @"H:|-sideDistance-[_roomImageView(imageViewWidth)]-sideDistance-[_areaLabel]-60-|";
    NSArray *hCons2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons2];
    
    NSString *hVFL3 = @"H:|-sideDistance-[_roomImageView(imageViewWidth)]-sideDistance-[_bedLabel]-20-|";
    NSArray *hCons3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL3 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons3];
    
    _guideImageView.frame = CGRectMake(self.frame.size.width - 50, self.frame.size.height / 2.0 - 10 , 20, 20);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    [self.delegate clickHotelHeaderView:_section];
}

@end
