//
//  ZGWeatherModel.m
//  景点助手
//
//  Created by ZZG on 15/12/12.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGWeatherModel.h"

@implementation ZGWeatherModel

+ (NSMutableArray *)weatherInfoWithDic:(NSDictionary *)weatherDic {
    
    NSMutableArray *array = [NSMutableArray array];
    ZGWeatherModel *todayWeather = [[ZGWeatherModel alloc]init];
    //取出返回的实时天气的数据
    NSDictionary *sk = [NSDictionary dictionaryWithDictionary: weatherDic[@"sk"]];
    todayWeather.tempNow = sk[@"temp"];
    //取出今天的天气详情
    NSDictionary *today = [NSDictionary dictionaryWithDictionary:weatherDic[@"today"]];
    todayWeather.temp = today[@"temperature"];
    todayWeather.wind = today[@"wind"];
    todayWeather.week = today[@"week"];
    todayWeather.feel = today[@"dressing_index"];
    todayWeather.dress = today[@"dressing_advice"];
    todayWeather.wash = today[@"wash_index"];
    todayWeather.exercise = today[@"exercise_index"];
    todayWeather.travel = today[@"travel_index"];
    todayWeather.date = today[@"date_y"];
    todayWeather.weather = today[@"weather"];
    todayWeather.drying = today[@"drying_index"];
    
    //将今日的天气数据加入数组中，作为第一个元素
    [array addObject:todayWeather];
    
    //取出将来几天的数据
    NSArray *futureWeatherArray = [NSArray arrayWithArray:weatherDic[@"future"]];
    for (NSDictionary *dic in futureWeatherArray) {
        ZGWeatherModel *weather = [[ZGWeatherModel alloc]init];
        weather.temp = dic[@"temperature"];
        weather.weather = dic[@"weather"];
        weather.week = dic[@"week"];
        weather.wind = dic[@"wind"];
        //只给这四项赋值，其余项不赋值
        [array addObject:weather];
    }

    return array;
}

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@   %@  %@  %@  %@  %@  %@  %@  %@  %@  %@  %@",self.temp,self.tempNow, self.travel, self.wash, self.weather,self.week, self.wind, self.wind, self.exercise, self.feel, self.drying, self.dress];
}

@end
