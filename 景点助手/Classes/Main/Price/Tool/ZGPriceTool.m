//
//  ZGPriceTool.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGPriceTool.h"
#import "ZGPriceModel.h"
#import "ZGHttpTool.h"
#import "ZGDataTool.h"

@implementation ZGPriceTool

+ (void)priceWithScenicId:(NSString *)scenicId success:(PriceSuccessBlock)success failure:(PriceFailureBlock)failure {
    
    NSString *path = @"/TicketInfo";
    NSDictionary *params = @{@"sid":scenicId};
    
    [ZGHttpTool getWithPath:path params:params
    success:^(id JSON) {
        
        //数组用来存储价格数组
        NSMutableArray *priceArray = [NSMutableArray array];;

        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"%@", JSON);
            success(priceArray);
            return;
        }
       
        //将取回来的数据存入文件中
        [ZGDataTool saveDataWithPath:path params:params withData:JSON];
        
        //开始解析JSON数据
        NSArray *array = JSON[@"result"];
        for (NSDictionary *dic in array) {
            ZGPriceModel *price = [[ZGPriceModel alloc]initWithDic:dic];
            [priceArray addObject:price];
        }
        
        //回调block
        success(priceArray);
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
}

@end
