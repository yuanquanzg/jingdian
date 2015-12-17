//
//  ZGRoomDetail.h
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 房间的详细信息，用于ZGRoomListCell
 */

#import <Foundation/Foundation.h>

@interface ZGRoomDetail : NSObject

@property (strong, nonatomic) NSString *name;   //名称
@property (strong, nonatomic) NSString *price;  //价格
@property (strong, nonatomic) NSString *breakfast;  //早餐
@property (strong, nonatomic) NSString *gift;   //其他优惠

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
