//
//  ZGRoomListCell.m
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGRoomListCell.h"
#import "ZGRoomDetail.h"

@interface ZGRoomListCell ()

@property (strong, nonatomic) UILabel *nameLabel;   //房间名称
@property (strong, nonatomic) UILabel *breakfastLabel;  //早餐
@property (strong, nonatomic) UILabel *giftLabel;   //礼物
@property (strong, nonatomic) UILabel *priceLabel;  //价格

@end

const static CGFloat KLabelDistance = 5;
const static CGFloat KSideDistance = 20;
const static CGFloat KNameLabelHeight = 20;
const static CGFloat KPriceLabelHeight = 10;

@implementation ZGRoomListCell


+ (instancetype)initWithTableView:(UITableView *)tableView RoomDetail:(ZGRoomDetail *)roomDetail {
    
    static NSString *identifier = @"hotelListCell";
    ZGRoomListCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ZGRoomListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.nameLabel.text = roomDetail.name;
    cell.breakfastLabel.text = roomDetail.breakfast;
    cell.priceLabel.text = roomDetail.price;
    cell.giftLabel.text = roomDetail.gift;
    return cell;
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
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _nameLabel.textAlignment = NSTextAlignmentLeft;
    _nameLabel.font = [UIFont systemFontOfSize:16.0];
    [self addSubview:_nameLabel];
    
    _breakfastLabel = [[UILabel alloc]init];
    _breakfastLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _breakfastLabel.textAlignment = NSTextAlignmentLeft;
    _breakfastLabel.font = [UIFont systemFontOfSize:12.0];
    _breakfastLabel.textColor = [UIColor grayColor];
    [self addSubview:_breakfastLabel];
    
    _giftLabel = [[UILabel alloc]init];
    _giftLabel.numberOfLines = 0;
    _giftLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _giftLabel.textAlignment = NSTextAlignmentLeft;
    _giftLabel.font = [UIFont systemFontOfSize:12.0];
    _giftLabel.textColor = [UIColor grayColor];
    [self addSubview:_giftLabel];
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.textAlignment = NSTextAlignmentRight;
    _priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
    _priceLabel.textColor = [UIColor redColor];
    _priceLabel.font = [UIFont systemFontOfSize:12.0];
    [self addSubview:_priceLabel];
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_nameLabel, _breakfastLabel, _giftLabel, _priceLabel);
    
    NSDictionary *distancesDict = @{@"sideDistance":[NSNumber numberWithFloat:KSideDistance], @"labelDistance":[NSNumber numberWithFloat:KLabelDistance], @"nameLabelHeight":[NSNumber numberWithFloat:KNameLabelHeight], @"priceLabelHeight":[NSNumber numberWithFloat:KPriceLabelHeight]};
    
    //纵向约束
    NSString *vVFL1 = @"V:|-labelDistance-[_nameLabel(nameLabelHeight)]-labelDistance-[_breakfastLabel(priceLabelHeight)]-labelDistance-[_giftLabel]-labelDistance-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-labelDistance-[_nameLabel(nameLabelHeight)]-labelDistance-[_priceLabel(priceLabelHeight)]-labelDistance-[_giftLabel]-labelDistance-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons2];
    
    //横向约束
    NSString *hVFL1 = @"H:|-sideDistance-[_nameLabel]-sideDistance-|";
    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons1];
    
    NSString *hVFL2 = @"H:|-sideDistance-[_breakfastLabel(==_priceLabel)]-sideDistance-[_priceLabel]-sideDistance-|";
    NSArray *hCons2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons2];
    
    NSString *hVFL3 = @"H:|-sideDistance-[_giftLabel]-sideDistance-|";
    NSArray *hCons3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL3 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons3];

}

+ (CGFloat)heightWithRoomDetail:(ZGRoomDetail *)roomDetail width:(CGFloat)width {
    CGFloat height = 0;
    
    height = KLabelDistance + KNameLabelHeight + KLabelDistance + KPriceLabelHeight + KLabelDistance;
    
    CGRect titleFrame = [roomDetail.gift boundingRectWithSize:CGSizeMake(width - KLabelDistance, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12.0]} context:nil];

    height += titleFrame.size.height + KSideDistance;

    return height;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
