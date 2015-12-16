//
//  ZGRoomModel.h
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGRoomModel : NSObject

@property (assign, nonatomic) BOOL isSpread;    //是否展开
@property (strong, nonatomic) NSString *roomName;   // 房间名称
@property (strong, nonatomic) NSString *area;   //房间面积
@property (strong, nonatomic) NSString *bed;    //床位信息
@property (strong, nonatomic) NSString *imageName;  //图片名称，随机生成，采用本地图片

@property (strong, nonatomic) NSMutableArray *roomArray;   //房间信息

- (instancetype)initWithDic:(NSDictionary *)dict;

@end
/*
 酒店房间信息展示思路：采用类似QQ好友列表的方式实现
 1、一个数组，存储房间信息，两个cell风格，一个做为每组的第一个Cell，另一个做为其他房间信息的Cell
 2、当点击第一个Cell时，如果
*/