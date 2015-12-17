//
//  ZGCollectionModel.h
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//
/*
 保存进文件中的收藏数据的封装
 用于ZGCellShareView与Collection模块中
 */

#import <Foundation/Foundation.h>

@interface ZGCollectionModel : NSObject<NSCoding>

@property (strong, nonatomic) NSString *thingId;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *thingName;

- (instancetype)initWithId:(NSString *)thingId imageUrl:(NSString *)imageUrl name:(NSString *)thingName;

@end
