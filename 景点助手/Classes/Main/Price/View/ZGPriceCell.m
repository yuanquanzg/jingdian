//
//  ZGPriceCell.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGPriceCell.h"
#import "ZGDetailLabel.h"
#import "ZGPriceModel.h"

@interface ZGPriceCell ()

@property (strong, nonatomic) UILabel *nameLabel;  //门票名称
@property (strong, nonatomic) UILabel *priceMKNameLabel;    //
@property (strong, nonatomic) UILabel *priceMKLabel;
@property (strong, nonatomic) UILabel *priceNameLabel;
@property (strong, nonatomic) UILabel *priceLabel;

@end

const static CGFloat KLabelHeight = 30;

@implementation ZGPriceCell

+ (instancetype)initWithTableView:(UITableView *)tableView priceModel:(ZGPriceModel *)price {
    static NSString *idetifier = @"priceCell";
    ZGPriceCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    if (cell == nil) {
        cell = [[ZGPriceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
    }
    cell.nameLabel.text = price.priceName;
    cell.priceMKLabel.text = price.priceMk;
    cell.priceLabel.text = price.price;
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildView];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)buildView {
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.numberOfLines = 0;
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_nameLabel];
    
    _priceMKNameLabel = [[UILabel alloc]init];
    _priceMKNameLabel.text = @"标准价格";
    _priceMKNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_priceMKNameLabel];
    
    _priceMKLabel = [[UILabel alloc]init];
    [_priceMKLabel setTextColor:[UIColor redColor]];
    _priceMKLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_priceMKLabel];
    
    _priceNameLabel = [[UILabel alloc]init];
    _priceNameLabel.text = @"优惠价格";
    _priceNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_priceNameLabel];
    
    _priceLabel = [[UILabel alloc]init];
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    _priceLabel.textColor = [UIColor redColor];
    [self addSubview:_priceLabel];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    //价格标题位置
    CGRect nameFrame = [_nameLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width - 20, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20.0]} context:nil];
    
    _nameLabel.frame = CGRectMake(10, 5, self.frame.size.width - 20, nameFrame.size.height);
    
    _priceMKNameLabel.frame = CGRectMake(0, _nameLabel.frame.size.height + _nameLabel.frame.origin.y + 5, self.frame.size.width * 0.5, KLabelHeight);
    _priceMKLabel.frame = CGRectMake(_priceMKNameLabel.frame.size.width, _priceMKNameLabel.frame.origin.y, self.frame.size.width * 0.5, KLabelHeight);
    
    _priceNameLabel.frame = CGRectMake(0, _priceMKNameLabel.frame.origin.y + _priceMKNameLabel.frame.size.height + 5, self.frame.size.width * 0.5, KLabelHeight);
    _priceLabel.frame = CGRectMake(_priceNameLabel.frame.size.width, _priceNameLabel.frame.origin.y, self.frame.size.width * 0.5, KLabelHeight);
}


+ (CGFloat)heightForCellWithPriceModel:(ZGPriceModel *)price width:(CGFloat)width{
    
    //价格标题位置
    CGRect nameFrame = [price.priceName boundingRectWithSize:CGSizeMake(width - 20, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20.0]} context:nil];
    
    return nameFrame.size.height + 3 * 5 + 2 *KLabelHeight;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
