//
//  ZGDetailCell.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGDetailCell.h"
#import "ZGScenicDetail.h"
#import "UIImageView+ZGTool.h"
#import "ZGDetailLabel.h"

@interface ZGDetailCell ()

@property (strong, nonatomic) UIImageView *scenicImage; //景点详情
@property (strong, nonatomic) ZGDetailLabel *titleLabel;  //景点名称
@property (strong, nonatomic) ZGDetailLabel *contentLabel;    //景点简介

@end

@implementation ZGDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //设置为不可点击
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self buildView];
     }
    return self;
}

//类方法，直接返回cell的实例，cell的复用和控件传值在此完成
+ (instancetype)initWithTableView:(UITableView *)tableView scenicDetail:(ZGScenicDetail *)detail {
    
    static NSString *identifier = @"detailCell";
    ZGDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ZGDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier ];
    }

    [cell.titleLabel setText:detail.name];
    [cell.contentLabel setText:detail.referral];
    [cell.scenicImage loadImageWithUrl:detail.imageUrl];
    
    
    return cell;
}

- (void)buildView {
    
    _titleLabel = [[ZGDetailLabel alloc]init];
//    _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_titleLabel setFont:[UIFont systemFontOfSize:18.0]];
    _titleLabel.numberOfLines = 0;
    [self addSubview:_titleLabel];
    
    _scenicImage = [[UIImageView alloc]init];
//    _scenicImage.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_scenicImage];
    
    _contentLabel = [[ZGDetailLabel alloc]init];
//    _contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_contentLabel setFont:[UIFont systemFontOfSize:15.0]];
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //景点标题位置
    CGRect titleFrame = [_titleLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width - 6, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0]} context:nil];

    _titleLabel.frame = CGRectMake(3, 5, self.frame.size.width - 6, titleFrame.size.height);

    //景点图片位置
    _scenicImage.frame = CGRectMake(0, 5 + titleFrame.size.height + 5, self.frame.size.width, 200);
    
    //景点性情位置
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    //    style.alignment = NSTextAlignmentLeft;  //对齐
    style.headIndent = 0.0f;//行首缩进
    style.firstLineHeadIndent = 20.0f;//首行缩进
    style.tailIndent = 0.0f;//行尾缩进
    style.lineSpacing = 5.0f;//行间距
    CGRect contentFrame = [_contentLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width - 6, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0], NSParagraphStyleAttributeName:style} context:nil];
 
    _contentLabel.frame = CGRectMake( 3, _scenicImage.frame.origin.y + _scenicImage.frame.size.height, self.frame.size.width - 3, contentFrame.size.height + 5);
    
 }

+ (CGFloat)heightForCellWidthScenicDetail:(ZGScenicDetail *)detail width:(CGFloat)width {
    
    CGFloat height = 0;
    
    CGRect titleFrame = [detail.name boundingRectWithSize:CGSizeMake(width - 6, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18.0]} context:nil];
    
    height =  5 + titleFrame.size.height + 5 + 200;
    
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    //    style.alignment = NSTextAlignmentLeft;  //对齐
    style.headIndent = 0.0f;//行首缩进
    style.firstLineHeadIndent = 20.0f;//首行缩进
    style.tailIndent = 0.0f;//行尾缩进
    style.lineSpacing = 5.0f;//行间距
    CGRect contentFrame = [detail.referral boundingRectWithSize:CGSizeMake(width - 6, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15.0], NSParagraphStyleAttributeName:style} context:nil];
    
    height += 5 + contentFrame.size.height + 5;
    
    return height;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
