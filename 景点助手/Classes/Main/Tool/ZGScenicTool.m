//
//  ZGScenicTool.m
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGScenicTool.h"
#import "ZGHttpTool.h"
#import "ZGScenicSimple.h"

@implementation ZGScenicTool

+ (void)ScenicWithPage:(NSInteger)page success:(ScenicSuccessBlock)success failure:(ScenicFailureBlock)failure {
    [ZGHttpTool getWithPath:@"/scenery" params:@{
        @"pid":@2,
        @"cid":@45,
        @"page":[NSString stringWithFormat:@"%ld", page]
    } success:^(id JSON) {
        //该数组用来存储返回的所有景点
        NSMutableArray *scenicArray = [NSMutableArray array];

        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"没有数据了");
            success(scenicArray);
            return;
        }
        
        //开始解析JSON数据
        NSArray *array = JSON[@"result"];
        for (NSDictionary *dic in array) {
            ZGScenicSimple *scenic = [[ZGScenicSimple alloc]initWithDic:dic];
            [scenicArray addObject:scenic];
        }
        
        //回调block
        success(scenicArray);
        
        NSLog(@"page--->%ld", page);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
