//
//  ZGTodayDetailCell.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 今日详细信息的Cell
 */

#import <UIKit/UIKit.h>
@class ZGWeatherModel;

@interface ZGTodayDetailCell : UITableViewCell

- (instancetype)initWithWeather:(ZGWeatherModel *)weather;

@end
