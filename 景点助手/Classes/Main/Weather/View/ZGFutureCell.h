//
//  ZGFutureCell.h
//  景点助手
//
//  Created by ZZG on 15/12/13.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 展示未来几天的天气
 */

#import <UIKit/UIKit.h>
@class ZGWeatherModel;

@interface ZGFutureCell : UITableViewCell

- (instancetype)initWithWeather:(ZGWeatherModel *)weather;

@end
