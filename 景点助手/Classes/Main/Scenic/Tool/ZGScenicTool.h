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
#import "ZGScenicDetail.h"

//景点列表返回block
typedef void(^ScenicSuccessBlock)(NSMutableArray *scenicArray);
typedef void(^ScenicFailureBlock)(NSError *error);


//景点详细信息block
typedef void(^DetailSuccessBlock)(NSMutableArray *detailArray);
typedef void(^DetailFailureBlock)(NSError *error);

@interface ZGScenicTool : NSObject

//返回景点列表
+ (void)ScenicWithPage:(NSInteger)page success:(ScenicSuccessBlock)success failure:(ScenicFailureBlock)failure;

//返回景点详情
+ (void)DetailWithScenicId:(NSString *)scenicId success:(DetailSuccessBlock)success failure:(DetailFailureBlock)failure;
@end
