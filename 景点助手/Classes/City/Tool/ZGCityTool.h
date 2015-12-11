//
//  ZGCityTool.h
//  景点助手
//
//  Created by ZZG on 15/12/10.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 城市数据请求类
 用于连接HttpTool类请求城市数据
 */

#import <Foundation/Foundation.h>

//景点列表返回block
typedef void(^CitySuccessBlock)(NSMutableArray *cityArray);
typedef void(^CityFailureBlock)(NSError *error);


@interface ZGCityTool : NSObject

//返回城市数据
+ (void)CityWithSuccess:(CitySuccessBlock)success failure:(CityFailureBlock)failure;


@end
