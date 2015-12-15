//
//  ZGHotelTool.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 酒店信息工具类
 得到酒店信息
 */

#import <Foundation/Foundation.h>
@class  ZGHotelDetail;

//酒店列表返回block
typedef void(^HotelSuccessBlock)(NSMutableArray *hotelArray);
typedef void(^HotelFailureBlock)(NSError *error);

//酒店详细信息返回block
typedef void(^DetailSuccessBlock)(ZGHotelDetail *hotelDeatil);
typedef void(^DetailFailureBlock)(NSError *error);

//酒店床位返回block
typedef void(^RoomSuccessBlock)(NSMutableArray *roomArray);
typedef void(^RoomFailureBlock)(NSError *error);

@interface ZGHotelTool : NSObject

//返回酒店列表
+ (void)hotelListWithPage:(NSInteger)page success:(HotelSuccessBlock)success failure:(HotelFailureBlock)failure;

//返回酒店详细信息
+ (void)hotelDetailWithId:(NSString *)hotelId imageUrl:(NSString *)imageUrl success:(DetailSuccessBlock)success failure:(DetailFailureBlock)failure;

//返回酒店房间信息
+ (void)roomWithId:(NSString *)hotelID success:(RoomSuccessBlock)success failure:(RoomFailureBlock)failure;

@end
