//
//  ZGTodayCell.h
//  景点助手
//
//  Created by ZZG on 15/12/13.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 展示今日天气的Cell
 */

#import <UIKit/UIKit.h>
@class ZGWeatherModel;

@interface ZGTodayCell : UITableViewCell

- (instancetype)initWithWeather:(ZGWeatherModel *)weather;

@end
