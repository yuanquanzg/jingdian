//
//  ZGAdviceCell.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 给出今日的建议的Cell
 */

#import <UIKit/UIKit.h>
@class ZGWeatherModel;

@interface ZGAdviceCell : UITableViewCell

- (instancetype)initWithWeather:(ZGWeatherModel *)weather;

@end
