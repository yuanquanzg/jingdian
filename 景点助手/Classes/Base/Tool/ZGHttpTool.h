//
//  ZGHttpTool.h
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
    网络请求工具类，此类用于连接AFNetworking和项目中网络请求
    防止AFNetworking的接口发生变化并且方便进行修改
*/

#import <Foundation/Foundation.h>

typedef void(^HttpSuccessBlock)(id JSON);
typedef void(^HttpFailureBlock)(NSError *error);

@interface ZGHttpTool : NSObject

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

//天气接口
+(void)weatherWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure;

@end
