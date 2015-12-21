//
//  ZGCityTool.m
//  景点助手
//
//  Created by ZZG on 15/12/10.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGCityTool.h"
#import "ZGHttpTool.h"
#import "ZGCityModel.h"
#import "ZGDataTool.h"

@implementation ZGCityTool

+ (void)CityWithSuccess:(CitySuccessBlock)success failure:(CityFailureBlock)failure {
    
    NSString *path = @"/cityList";
    NSDictionary *params = @{};
    
    
    [ZGHttpTool getWithPath:path params:params
    success:^(id JSON) {
        NSMutableArray *cityArray = [NSMutableArray array];
        
        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"出错了");
            success(cityArray);
            return;
        }
   
        //将取回来的数据存入文件中
        [ZGDataTool saveDataWithPath:path params:params withData:JSON];
        
        //处理数据
        NSArray *array = JSON[@"result"];
        for (NSDictionary *dic in array) {
            ZGCityModel *city = [[ZGCityModel alloc]initWithDic:dic];
            [cityArray addObject:city];
        }
        success(cityArray);
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        
        //取出数据
        NSDictionary * data = [ZGDataTool dataWithWithPath:path params:params];
        
        NSLog(@"%@", data);
        
        NSMutableArray *cityArray = [NSMutableArray array];
        //处理数据
        NSArray *array = data[@"result"];
        for (NSDictionary *dic in array) {
            ZGCityModel *city = [[ZGCityModel alloc]initWithDic:dic];
            [cityArray addObject:city];
        }
        success(cityArray);
    }];
}

@end
