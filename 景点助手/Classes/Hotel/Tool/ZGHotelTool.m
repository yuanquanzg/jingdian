//
//  ZGHotelTool.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelTool.h"
#import "ZGHttpTool.h"
#import "ZGHotelModel.h"
#import "ZGDataTool.h"
#import "ZGHotelDetail.h"

@implementation ZGHotelTool

//返回酒店列表
+ (void)hotelListWithPage:(NSInteger)page success:(HotelSuccessBlock)success failure:(HotelFailureBlock)failure {
    NSString *path = @"/HotelList";
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    NSDictionary *params = @{@"cityid":[defaults objectForKey:@"cityId"], @"page":[NSString stringWithFormat:@"%ld", page]};
    
    [ZGHttpTool getWithPath:path params:params
    success:^(id JSON) {
        NSMutableArray *hotelArray = [NSMutableArray array];
        
        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"出错了");
            success(hotelArray);
            return;
        }
        
        //将取回来的数据存入文件中
        [ZGDataTool saveDataWithPath:path params:params withData:JSON];
        
        //处理数据
        NSArray *array = JSON[@"result"];
        for (NSDictionary *dic in array) {
            ZGHotelModel *city = [[ZGHotelModel alloc]initWithDic:dic];
            [hotelArray addObject:city];
        }
        
        success(hotelArray);
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
        
        NSMutableArray *hotelArray = [NSMutableArray array];

        NSDictionary *dict = [ZGDataTool dataWithWithPath:path params:params];
        NSLog(@"%@", dict);
        //处理数据
        NSArray *array = dict[@"result"];
        for (NSDictionary *dic in array) {
            ZGHotelModel *city = [[ZGHotelModel alloc]initWithDic:dic];
            [hotelArray addObject:city];
        }
        
        success(hotelArray);

    }];
    
}


//返回酒店详细信息
+ (void)hotelDetailWithId:(NSString *)hotelId imageUrl:(NSString *)imageUrl success:(DetailSuccessBlock)success failure:(DetailFailureBlock)failure {
    
    NSString *path = @"/GetHotel";
    NSDictionary *params =  @{@"hid":hotelId};
    
    [ZGHttpTool getWithPath:path params:params
    success:^(id JSON) {
        ZGHotelDetail *hotelDeatil;
        if (![JSON[@"error_code"] isEqualToNumber:@0]) {
            NSLog(@"出错了");
            success(hotelDeatil);
            return;
        }
        
        //将取回来的数据存入文件中
        [ZGDataTool saveDataWithPath:path params:params withData:JSON];
        
        hotelDeatil =  [[ZGHotelDetail alloc]initWithDic:JSON[@"result"] iamgeUrl:imageUrl];
        
        success(hotelDeatil);
    } failure:^(NSError *error) {
        
    }];
    
}

//返回酒店房间信息
+ (void)roomWithId:(NSString *)hotelID success:(RoomSuccessBlock)success failure:(RoomFailureBlock)failure {
    
}

@end
