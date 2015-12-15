//
//  ZGPriceCell.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGPriceModel;

@interface ZGPriceCell : UITableViewCell


+ (instancetype)initWithTableView:(UITableView *)tableView priceModel:(ZGPriceModel *)price;

+ (CGFloat)heightForCellWithPriceModel:(ZGPriceModel *)price width:(CGFloat)width;

@end
