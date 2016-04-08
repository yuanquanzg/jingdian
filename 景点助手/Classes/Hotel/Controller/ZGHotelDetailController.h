//
//  ZGHotelDetailController.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 酒店详情与房间信息的展示
 */

#import "ZGViewController.h"
//#import "ZGTableViewController.h"

@interface ZGHotelDetailController : ZGViewController

@property (strong, nonatomic) NSString *hotelId;

@property (strong, nonatomic) NSString *imageUrl;

@property (strong, nonatomic) NSString *hotelName;

@end
