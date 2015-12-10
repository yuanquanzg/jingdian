//
//  ZGScenicDetail.h
//  景点助手
//
//  Created by ZZG on 15/12/8.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 景点详细信息的模型类
 用于对景点的详细信息进行包装
 */


#import <Foundation/Foundation.h>

@interface ZGScenicDetail : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *referral;
@property (strong, nonatomic) NSString *imageUrl;


- (instancetype)initWithDic:(NSDictionary *)dic;

@end
