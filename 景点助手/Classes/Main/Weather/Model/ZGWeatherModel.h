//
//  ZGWeatherModel.h
//  景点助手
//
//  Created by ZZG on 15/12/12.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 天气数据的封装
 */
#import <Foundation/Foundation.h>

@interface ZGWeatherModel : NSObject

@property (nonatomic, strong) NSString *weather;    //天气
@property (nonatomic, strong) NSString *tempNow;    //实时天气
@property (nonatomic, strong) NSString *temp;   //温度
@property (nonatomic, strong) NSString *wind;   //风力
@property (nonatomic, strong) NSString *date;   //日期
@property (nonatomic, strong) NSString *week;   //星期
@property (nonatomic, strong) NSString *feel;  //体感
@property (nonatomic, strong) NSString *dress;  //建议着衣
@property (nonatomic, strong) NSString *wash;   //洗浴
@property (nonatomic, strong) NSString *drying;   //驾车
@property (nonatomic, strong) NSString *travel;   //出游
@property (nonatomic, strong) NSString *exercise;   //锻炼


+ (NSMutableArray *)weatherInfoWithDic:(NSDictionary *)weatherDic;

@end
