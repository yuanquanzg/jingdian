//
//  ZGHotelListCell.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelListCell.h"
#import "ZGHotelModel.h"
#import "UIImageView+ZGTool.h"

@interface ZGHotelListCell ()

@property (strong, nonatomic) UIImageView *hotelImageView;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *gradeLabel;
@property (strong, nonatomic) UILabel *addressLabel;

@property (strong, nonatomic) NSString *hotelId;

@end

@implementation ZGHotelListCell

+ (instancetype)initWithTableView:(UITableView *)tableView priceModel:(ZGHotelModel *)hotel {
    static NSString *idetifier = @"hotelCell";
    ZGHotelListCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    if (cell == nil) {
        cell = [[ZGHotelListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
    }
    cell.imageUrl = hotel.hotelImage;
    cell.hotelId = hotel.hotelId;
    cell.gradeLabel.text = hotel.hotelGrade;
    cell.nameLabel.text = hotel.hotelName;
    cell.addressLabel.text = hotel.hotelAdress;
    
    [cell.hotelImageView loadImageWithUrl:hotel.hotelImage];
    return cell;
}


- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildView];
        
        UIImageView *accView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hotel_cell_accessoryView"]];
        accView.frame = CGRectMake(0, 0, 20, 20);
        self.accessoryView = accView;
        
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return self;
}

- (void)buildView {
    
    _hotelImageView = [[UIImageView alloc]init];
    [_hotelImageView loadImageWithUrl:_imageUrl];
    _hotelImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_hotelImageView];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.numberOfLines = 0;
    _nameLabel.font = [UIFont systemFontOfSize:20.0];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_nameLabel];
    
    _gradeLabel = [[UILabel alloc]init];
    _gradeLabel.font = [UIFont systemFontOfSize:16.0];
    _gradeLabel.textColor = [UIColor grayColor];
    _gradeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_gradeLabel];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.font = [UIFont systemFontOfSize:16.0];
    _addressLabel.textColor = [UIColor grayColor];
    _addressLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_addressLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_hotelImageView, _nameLabel, _gradeLabel, _addressLabel);
    
    NSDictionary *distancesDict = @{@"sideDistance":[NSNumber numberWithFloat:10], @"labelDistance":[NSNumber numberWithFloat:5], @"nameLabelHeight":[NSNumber numberWithFloat:self.frame.size.height * 1 / 3.0], @"imageViewWidth":[NSNumber numberWithFloat:self.frame.size.height]};
    
    //纵向约束
    NSString *vVFL1 = @"V:|-sideDistance-[_hotelImageView]-sideDistance-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-sideDistance-[_nameLabel(nameLabelHeight)]-sideDistance-[_gradeLabel(==_addressLabel)]-labelDistance-[_addressLabel]-sideDistance-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons2];
    
    //横向约束
    NSString *hVFL1 = @"H:|-sideDistance-[_hotelImageView(imageViewWidth)]-sideDistance-[_nameLabel]-20-|";
    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons1];
    
    NSString *hVFL2 = @"H:|-sideDistance-[_hotelImageView(imageViewWidth)]-sideDistance-[_gradeLabel]-20-|";
    NSArray *hCons2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons2];
    
    NSString *hVFL3 = @"H:|-sideDistance-[_hotelImageView(imageViewWidth)]-sideDistance-[_addressLabel]-20-|";
    NSArray *hCons3 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL3 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons3];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
