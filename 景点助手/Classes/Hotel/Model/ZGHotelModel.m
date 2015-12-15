//
//  ZGHotelModel.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelModel.h"

@implementation ZGHotelModel
/*
 "id": "5829",
 "name": "黄山白云宾馆",
 "className": "四星级",
 "intro": "黄山白云宾馆位于黄山风景区天海景区，黄山光明顶下约300米处，是连接黄山前、后山的必经之地，可方便前往黄山新景（西海大峡谷）。",
 "dpNum": "849",
 "Lat": "30.13676038",
 "Lon": "118.17596229",
 "address": "天海景区",
 "largePic": "http://pic2.40017.cn/hotel/2015/7/23/11/10/C/a015ea403c15419ea78e63e9a25dc5a3_400x300_01.jpg",
 "cityId": "45",
 "url": "http://www.ly.com/HotelInfo-5829.html",
 "manyidu": "91%"
 */



- (instancetype)initWithDic:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.hotelId = dict[@"id"];
        self.hotelGrade = dict[@"className"];
        self.hotelName = dict[@"name"];
        self.hotelIntro = dict[@"intro"];
        self.hotelLat = dict[@"Lat"];
        self.hotelLon = dict[@"Lon"];
        self.hotelAdress = dict[@"address"];
        self.hotelImage = dict[@"largePic"];
    }
    return self;
}

@end
