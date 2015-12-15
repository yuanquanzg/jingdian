//
//  ZGDataTool.h
//  景点助手
//
//  Created by ZZG on 15/12/13.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 将返回的数据存储进文件中
 以备不时之需
 */

#import <Foundation/Foundation.h>

@interface ZGDataTool : NSObject

//保存数据
+ (void)saveDataWithPath:(NSString *)path params:(NSDictionary *)dict withData:(id)JSON;

//取出数据
+ (id)dataWithWithPath:(NSString *)path params:(NSDictionary *)dict;

@end
