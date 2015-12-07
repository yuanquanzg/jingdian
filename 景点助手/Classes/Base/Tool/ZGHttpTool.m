//
//  ZGHttpTool.m
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHttpTool.h"
#import "AFNetworking.h"


#define KBaseURL @"http://apis.haoservice.com/lifeservice/travel"
#define AppKey @"efea0e358b964dd5afe6b569723d535b"

@implementation ZGHttpTool

+ (void)getWithPath:(NSString *)path params:(NSDictionary *)params success:(HttpSuccessBlock)success failure:(HttpFailureBlock)failure
{
    //    [self requestWithPath:path params:params success:success failure:failure method:@"GET"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    NSString *str = [NSString stringWithFormat:@"%@%@", KBaseURL, path];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:params];
    [dict setObject:AppKey forKey:@"key"];
    
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
