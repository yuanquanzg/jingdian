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
#import "ZGScenicDetail.h"
#import "ZGDataTool.h"

@implementation ZGScenicTool

+ (void)scenicWithPage:(NSInteger)page success:(ScenicSuccessBlock)success failure:(ScenicFailureBlock)failure {
    
    NSString*path = @"/scenery";
    
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    NSDictionary *params = @{@"pid":[defaults objectForKey:@"provinId"],@"cid":[defaults objectForKey:@"cityId"],@"page":[NSString stringWithFormat:@"%ld", page]} ;
    
    
    [ZGHttpTool getWithPath:path params:params
    success:^(id JSON) {
        //该数组用来存储返回的所有景点
        NSMutableArray *scenicArray = [NSMutableArray array];

        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"没有数据了");
            success(scenicArray);
            //取出存入文件的信息
            NSDictionary * dict = [ZGDataTool dataWithWithPath:path params:params];
            NSLog(@"%@", dict);

            return;
        }

        //将取回来的数据存入文件中
        [ZGDataTool saveDataWithPath:path params:params withData:JSON];
        
        //开始解析JSON数据
        NSArray *array = JSON[@"result"];
        for (NSDictionary *dic in array) {
            ZGScenicSimple *scenic = [[ZGScenicSimple alloc]initWithDic:dic];
            [scenicArray addObject:scenic];
        }
        
        //回调block
        success(scenicArray);
        
    } failure:^(NSError *error) {
//        failure(error);
        NSLog(@"%@", error);
        
        //取出存入文件的信息
        NSDictionary * dict = [ZGDataTool dataWithWithPath:path params:params];
        NSLog(@"%@", dict);
      
        //该数组用来存储返回的所有景点
        NSMutableArray *scenicArray = [NSMutableArray array];
        
        //开始解析JSON数据
        NSArray *array = dict[@"result"];
        for (NSDictionary *dic in array) {
            ZGScenicSimple *scenic = [[ZGScenicSimple alloc]initWithDic:dic];
            [scenicArray addObject:scenic];
        }
        
        //回调block
        success(scenicArray);
    }];
}


+ (void)detailWithScenicId:(NSString *)scenicId success:(DetailSuccessBlock)success failure:(DetailFailureBlock)failure {
    
    NSString *path = @"/GetScenery";
    NSDictionary *params = @{@"sid":scenicId};
    
    [ZGHttpTool getWithPath:path params:params
    success:^(id JSON) {
        //该数组用来存储返回景点详情
        NSMutableArray *detailArray = [NSMutableArray array];

        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"没有数据了");
            NSLog(@"%@", JSON);
//            NSDictionary * data = [ZGDataTool dataWithWithPath:path params:params];
//            NSLog(@"%@", data);
            success(detailArray);
            return;
        }
        
        //将取回来的数据存入文件中
        [ZGDataTool saveDataWithPath:path params:params withData:JSON];
        
        //开始解析JSON数据
        NSArray *array = JSON[@"result"];
        for (NSDictionary *dic in array) {
            ZGScenicDetail *scenic = [[ZGScenicDetail alloc]initWithDic:dic];
            [detailArray addObject:scenic];
        }
        
        //回调block
        success(detailArray);

    } failure:^(NSError *error) {
        failure(error);
        NSLog(@"%@", error);
        
        NSDictionary * data = [ZGDataTool dataWithWithPath:path params:params];
        NSLog(@"%@", data);
    }];
}
@end
