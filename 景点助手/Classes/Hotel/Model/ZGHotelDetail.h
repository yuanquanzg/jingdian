//
//  ZGHotelDetail.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 酒店详情
 用于ZGHotelDetailCell
 */

#import <Foundation/Foundation.h>

@interface ZGHotelDetail : NSObject

@property (strong, nonatomic) NSString *imageUrl;   //图片地址
@property (strong, nonatomic) NSString *intro;  //简介
@property (strong, nonatomic) NSString *phoneNumber;    //电话

- (instancetype)initWithDic:(NSDictionary *)dict iamgeUrl:(NSString *)imageUrl;

@end
