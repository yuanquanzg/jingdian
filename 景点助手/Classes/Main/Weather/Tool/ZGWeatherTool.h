//
//  ZGWeatherTool.h
//  景点助手
//
//  Created by ZZG on 15/12/12.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
天气信息请求工具类
*/

#import <Foundation/Foundation.h>

typedef void(^WeatherSuccessBlock)(NSMutableArray *weatherArray);
typedef void(^WeatherFailureBlock)(NSError *error);

@interface ZGWeatherTool : NSObject

+ (void)weatherWithCity:(NSString *)cityName success:(WeatherSuccessBlock)success failure:(WeatherFailureBlock)failure;

@end
