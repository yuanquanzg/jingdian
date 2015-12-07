//
//  ZGScenicCell.m
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGScenicCell.h"
#import "ZGImageTool.h"
#import "ZGScenicSimple.h"
#import "UIImageView+WebCache.h"

@interface ZGScenicCell ()

@property (strong, nonatomic) UIImageView *bgImageView; //景点图片
@property (strong, nonatomic) UILabel *nameLabel;   //景点名称
@property (strong, nonatomic) UILabel *gradeLabel;   //景点等级
@property (strong, nonatomic) UILabel *addressLabel;    //景点地址
@property (strong, nonatomic) UIImageView *addressIcon;     //地址图标
@property (strong, nonatomic) UIImageView *gradeIcon;   //等级图标
@end

@implementation ZGScenicCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildView];
    }
    return self;
}

//类方法，直接返回cell的实例，cell的复用和控件传值在此完成
+ (instancetype)initWithTableView:(UITableView *)tableView scenicSimple:(ZGScenicSimple *)scenic {
    static NSString *identifier = @"scenicCell";
    ZGScenicCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ZGScenicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell.bgImageView sd_setImageWithURL:[NSURL URLWithString:scenic.imageUrl]];
    cell.nameLabel.text = scenic.title;
    cell.gradeLabel.text = scenic.grade;
    cell.addressLabel.text = scenic.address;
    return cell;
}

//初始化所有子控件并添加到Cell之上
- (void)buildView {
    
    _bgImageView = [[UIImageView alloc]init];
//    _bgImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_bgImageView];
    //设置图片旁边的阴影
//    _bgImageView.layer.shadowColor = [UIColor blackColor].CGColor;
//    _bgImageView.layer.shadowOffset = CGSizeMake(0, 5);
//    _bgImageView.layer.shadowOpacity = 0.5;
//    _bgImageView.layer.shadowRadius = 1.0;
//    _bgImageView.clipsToBounds = NO;

    
    _nameLabel = [[UILabel alloc]init];
    [_nameLabel setFont:[UIFont systemFontOfSize:22.0]];
    [_nameLabel setTextColor:[UIColor whiteColor]];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_bgImageView addSubview:_nameLabel];
    
    _gradeLabel = [[UILabel alloc]init];
    [_gradeLabel setTextColor:[UIColor whiteColor]];
    _gradeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_bgImageView addSubview:_gradeLabel];
    
    _addressLabel = [[UILabel alloc]init];
    [_addressLabel setFont:[UIFont systemFontOfSize:13.0]];
    [_addressLabel setTextColor:[UIColor whiteColor]];
    _addressLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_bgImageView addSubview:_addressLabel];
    
    _addressIcon = [[UIImageView alloc]init];
    _addressIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [_addressIcon setImage:[UIImage imageNamed:@"main_scenicCell_address"]];
    [_bgImageView addSubview:_addressIcon];
    
    _gradeIcon = [[UIImageView alloc]init];
    _gradeIcon.translatesAutoresizingMaskIntoConstraints = NO;
    [_gradeIcon setImage:[UIImage imageNamed:@"main_scenicCell_grade"]];
    [_bgImageView addSubview:_gradeIcon];
    
}

//此处确定各个控件的位置
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //图片的大小即是cell的大小
    _bgImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    // 垂直方向约束
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_addressLabel, _nameLabel, _gradeLabel, _addressIcon, _gradeIcon);
    // 垂直约束1:nameLabel与addressLabel相距10，addressLable与底部相距10
    NSString *vVFL1 = @"V:[_nameLabel(30)]-10-[_addressLabel(30)]-10-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:vCons1];
    //垂直约束2:gradeLabel与addressLabel相距10，addressLable与底部相距10
    NSString *vVFL2 = @"V:[_gradeLabel(30)]-10-[_addressLabel(30)]-10-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:vCons2];
    //垂直约束3:addressIcon与底部相距10
    NSString *vVFL3 = @"V:[_addressIcon(30)]-10-|";
    NSArray *vCons3 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL3 options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:vCons3];
    //垂直约束4:gradeIcon与addressLabel相距10
    NSString *vVFL4 = @"V:[_gradeIcon(30)]-15-[_addressLabel(30)]-10-|";
    NSArray *vCons4 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL4 options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:vCons4];
    
    
    //水平方向约束
    //水平约束1:nameLabel与左边界相距10，nameLbale与gradeLabel相距10，gradeLabel与右边界相距10
    NSString *hVFL1 = @"H:|-20-[_nameLabel]-10-[_gradeIcon(30)]-5-[_gradeLabel(60)]-10-|";
    NSArray *hCons1 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:hCons1];
    //水平约束2:addressLabel与左右边界相距10
    NSString *hVFL2 = @"H:|-10-[_addressIcon(30)]-5-[_addressLabel]-10-|";
    NSArray *hCons2 = [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:nil views:viewsDictionary];
    [self addConstraints:hCons2];
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    //[super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
