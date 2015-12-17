//
//  ZGCollectionTool.h
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 存文件读取与存入收藏的景点与酒店的的信息
 */

#import <Foundation/Foundation.h>

@interface ZGCollectionTool : NSObject

+ (NSMutableArray *)dataWithFileName:(NSString *)fileName;

+ (void)saveWithFileName:(NSString *)fileName dataArray:(NSMutableArray *)array;

@end
