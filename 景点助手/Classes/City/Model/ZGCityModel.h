//
//  ZGCityModel.h
//  景点助手
//
//  Created by ZZG on 15/12/11.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
城市信息的封装模型
 */

#import <Foundation/Foundation.h>


@interface ZGCityModel : NSObject

@property (strong, nonatomic) NSString *cityId; //城市ID
@property (strong, nonatomic) NSString *cityName;   //城市名称
@property (strong, nonatomic) NSString *provinId;   //省份ID

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
