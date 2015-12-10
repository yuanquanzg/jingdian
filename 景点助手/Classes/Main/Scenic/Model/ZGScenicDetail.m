//
//  ZGScenicDetail.m
//  景点助手
//
//  Created by ZZG on 15/12/8.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGScenicDetail.h"

@implementation ZGScenicDetail

- (instancetype)initWithDic:(NSDictionary *)dic {

    self = [super init];
    if (self) {
        self.name = dic[@"title"];
        self.referral = dic[@"referral"];
        self.imageUrl = dic[@"img"];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, %@", self.name, self.referral, self.imageUrl];
}

@end
