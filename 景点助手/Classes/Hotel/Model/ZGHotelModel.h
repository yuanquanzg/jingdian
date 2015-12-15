//
//  ZGHotelModel.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 酒店简单信息的封装
 用于酒店列表的展示
*/

#import <Foundation/Foundation.h>
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
@interface ZGHotelModel : NSObject

@property (strong, nonatomic) NSString *hotelId;    //酒店ID
@property (strong, nonatomic) NSString *hotelGrade; //酒店等级
@property (strong, nonatomic) NSString *hotelName;  //酒店名称
@property (strong, nonatomic) NSString *hotelIntro; //酒店简介
@property (strong, nonatomic) NSString *hotelLat;   //酒店经度
@property (strong, nonatomic) NSString *hotelLon;   //酒店纬度
@property (strong, nonatomic) NSString *hotelAdress;    //酒店地址
@property (strong, nonatomic) NSString *hotelImage; //酒店图片
//@property (strong, nonatomic) NSString *hotel

- (instancetype)initWithDic:(NSDictionary *)dict;

@end
