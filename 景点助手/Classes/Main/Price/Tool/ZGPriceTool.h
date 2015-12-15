//
//  ZGPriceTool.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PriceSuccessBlock)(NSMutableArray *priceArray );
typedef void(^PriceFailureBlock)(NSError *error);

@interface ZGPriceTool : NSObject

+ (void)priceWithScenicId:(NSString *)scenicId success:(PriceSuccessBlock)success failure:(PriceFailureBlock)failure;


@end
