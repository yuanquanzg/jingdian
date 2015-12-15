//
//  ZGPriceModel.h
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZGPriceModel : NSObject

@property (strong, nonatomic) NSString *priceName;  //门票名称
@property (strong, nonatomic) NSString *priceMk;    //原价
@property (strong, nonatomic) NSString *price;     //现在价格

- (instancetype)initWithDic:(NSDictionary *)dict;

@end
