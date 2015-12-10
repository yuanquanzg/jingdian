//
//  ZGScenicCell.h
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
    景点列表cell
    展示景点列表
 */

#import <UIKit/UIKit.h>

//声名此类，其与impor的区别为，impor会直接导入改文件，而@class不会
@class ZGScenicSimple;

@interface ZGScenicCell : UITableViewCell

+ (instancetype)initWithTableView:(UITableView *)tableView scenicSimple:(ZGScenicSimple *)scenic;

@end
