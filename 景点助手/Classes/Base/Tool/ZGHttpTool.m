//
//  ZGHttpTool.m
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHttpTool.h"
#import "AFNetworking.h"

//景点、酒店、票价
#define KOtherBaseURL @"http://apis.haoservice.com/lifeservice/travel"
#define OtherAppKey @"efea0e358b964dd5afe6b569723d535b"

//天气
#define KWeatherBaseURL @"http://apis.haoservice.com/weather"
#define WeatherAppKey @"8db01a616eb34847a8e1eefdeec546c9"

//交通



@implementation ZGHttpTool

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    //    [self requestWithPath:path params:params success:success failure:failure method:@"GET"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString *str = [NSString stringWithFormat:@"%@%@", KOtherBaseURL, path];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
    [dict setObject:OtherAppKey forKey:@"key"];
    
    [manager GET:str parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (responseObject == nil) {
            return;
        }
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (error == nil) {
            return;
        }
//        failure(error);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"NetworkError" object:nil];
    }];
    
}

+ (void)weatherWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString *str = [NSString stringWithFormat:@"%@%@", KWeatherBaseURL, path];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
    [dict setObject:WeatherAppKey forKey:@"key"];
    
    [manager GET:str parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (responseObject == nil) {
            return;
        }
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (error == nil) {
            return;
        }
        failure(error);
    }];

}


@end
