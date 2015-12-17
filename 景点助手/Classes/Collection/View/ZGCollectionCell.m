//
//  ZGCollectionCell.m
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGCollectionCell.h"
#import "ZGCollectionModel.h"
#import "UIImageView+ZGTool.h"

@interface ZGCollectionCell ()

@property (strong, nonatomic) UIImageView *cellImageView;
@property (strong, nonatomic) UILabel *nameLabel;

@end

@implementation ZGCollectionCell

+ (instancetype)initWithTableView:(UITableView *)tableView collectionModel:(ZGCollectionModel *)model {
    static NSString *idetifier = @"collectionCell";
    ZGCollectionCell *cell = [tableView dequeueReusableCellWithIdentifier:idetifier];
    if (cell == nil) {
        cell = [[ZGCollectionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idetifier];
    }
    [cell.cellImageView loadImageWithUrl:model.imageUrl];
    cell.nameLabel.text = model.thingName;
    
    return cell;
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildView];
        
        UIImageView *accView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"hotel_cell_accessoryView"]];
        accView.frame = CGRectMake(0, 0, 20, 20);
        self.accessoryView = accView;
    }
    return self;
}

- (void)buildView {
    
    _cellImageView = [[UIImageView alloc]init];
    _cellImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_cellImageView];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_nameLabel];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(_cellImageView, _nameLabel);
    NSDictionary *distancesDict = @{@"sideDistance":[NSNumber numberWithFloat:10.0], @"imageViewWidth":[NSNumber numberWithFloat:self.frame.size.height], @"labelSideDistance":[NSNumber numberWithFloat:30.0]};
    
    NSString *vVFL1 = @"V:|-sideDistance-[_cellImageView]-sideDistance-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-sideDistance-[_nameLabel]-sideDistance-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:vCons2];
    
    
    NSString *hVFL = @"H:|-sideDistance-[_cellImageView(imageViewWidth)]-sideDistance-[_nameLabel]-labelSideDistance-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:distancesDict views:viewsDict];
    [self addConstraints:hCons];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
