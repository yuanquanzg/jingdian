//
//  ZGScenicTool.h
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
    景点列表数据请求类
    用于连接HttpTool类请求景点列表数据
 */

#import <Foundation/Foundation.h>

typedef void(^ScenicSuccessBlock)(NSMutableArray *scenicArray);
typedef void(^ScenicFailureBlock)(NSError *error);

@interface ZGScenicTool : NSObject

+ (void)ScenicWithPage:(NSInteger)page success:(ScenicSuccessBlock)success failure:(ScenicFailureBlock)failure;

@end
