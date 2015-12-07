//
//  ZGScenicSimple.h
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
    景点简单信息的模型类
    用于对景点的简单信息进行包装
 */

#import <Foundation/Foundation.h>

@interface ZGScenicSimple : NSObject

@property (strong, nonatomic) NSString *address; //地址
@property (strong, nonatomic) NSString *grade; //等级
@property (strong, nonatomic) NSString *imageUrl; //图片地址
@property (strong, nonatomic) NSString *title; //名称
@property (strong, nonatomic) NSString *price; //价格


- (instancetype) initWithDic:(NSDictionary *)dict;

@end
