//
//  ZGWeatherTool.m
//  景点助手
//
//  Created by ZZG on 15/12/12.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGWeatherTool.h"
#import "ZGHttpTool.h"
#import "ZGWeatherModel.h"
#import "ZGDataTool.h"

@implementation ZGWeatherTool

+ (void)weatherWithCity:(NSString *)cityName success:(WeatherSuccessBlock)success failure:(WeatherFailureBlock)failure {
    
    NSString *path = @"";
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    cityName = [defaults objectForKey:@"cityName"];
    NSDictionary *params = @{@"cityname":cityName};
    
    [ZGHttpTool weatherWithPath:@"" params:params
    success:^(id JSON) {
    
        //该数组用来存储返回的所有景点
        NSMutableArray *weatherArray = [NSMutableArray array];
        
        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"没有数据了");
            success(weatherArray);
            return;
        }
        
        //将取回来的数据存入文件中
        [ZGDataTool saveDataWithPath:path params:params withData:JSON];
        
        //处理返回的数据
        weatherArray = [ZGWeatherModel weatherInfoWithDic:JSON[@"result"]];
        success(weatherArray);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        
        NSDictionary *dict = [ZGDataTool dataWithWithPath:path params:params];
//        NSLog(@"%@", dict);
        NSMutableArray *weatherArray = [NSMutableArray array];
        //处理返回的数据
        weatherArray = [ZGWeatherModel weatherInfoWithDic:dict[@"result"]];
        success(weatherArray);
    }];
}

@end
