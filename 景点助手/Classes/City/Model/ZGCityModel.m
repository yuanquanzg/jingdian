//
//  ZGCityModel.m
//  景点助手
//
//  Created by ZZG on 15/12/11.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGCityModel.h"

@implementation ZGCityModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        self.cityId = dic[@"cityId"];
        self.cityName = dic[@"cityName"];
        self.provinId = dic[@"provinceId"];
    }
    return self;
}

@end
