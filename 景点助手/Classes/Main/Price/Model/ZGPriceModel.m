//
//  ZGPriceModel.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGPriceModel.h"

@implementation ZGPriceModel

- (instancetype)initWithDic:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.price = dict[@"price"];
        self.priceMk = dict[@"price_mk"];
        self.priceName = dict[@"name"];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@    price_mk:%@    price:%@", self.priceName, self.priceMk, self.price];
}

@end
