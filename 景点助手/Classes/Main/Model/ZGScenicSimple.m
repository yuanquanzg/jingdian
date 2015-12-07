//
//  ZGScenicSimple.m
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGScenicSimple.h"

@implementation ZGScenicSimple

- (instancetype) initWithDic:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.address = dict[@"address"];
        self.grade = dict[@"grade"];
        self.imageUrl = dict[@"imgurl"];
        self.title = dict[@"title"];
        self.price = dict[@"price_min"];
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@-----%@----%@---%@---%@", self.address, self.grade, self.imageUrl, self.title, self.price];
}
@end
