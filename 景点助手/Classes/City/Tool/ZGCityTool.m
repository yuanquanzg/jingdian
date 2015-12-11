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

@implementation ZGCityTool

+ (void)CityWithSuccess:(CitySuccessBlock)success failure:(CityFailureBlock)failure {
    [ZGHttpTool getWithPath:@"/cityList" params:nil
    success:^(id JSON) {
        NSMutableArray *cityArray = [NSMutableArray array];
        
        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"出错了");
            success(cityArray);
            return;
        }
        
        NSArray *array = JSON[@"result"];
        for (NSDictionary *dic in array) {
            ZGCityModel *city = [[ZGCityModel alloc]initWithDic:dic];
            [cityArray addObject:city];
        }
        success(cityArray);
    } failure:^(NSError *error) {
        
    }];
}

@end
