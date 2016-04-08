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

- (void)setName:(NSString *)name {
    if (_name.length == 0) {
        _name = [name stringByReplacingOccurrencesOfString:@"&ldquo;" withString:@""];
        _name = [_name stringByReplacingOccurrencesOfString:@"&rdquo;" withString:@""];
        _name = [_name stringByReplacingOccurrencesOfString:@"|" withString:@"之理由" ];
        _name = [_name stringByReplacingOccurrencesOfString:@"理由1" withString:@"\n1、"];
        _name = [_name stringByReplacingOccurrencesOfString:@"理由2" withString:@"\n2、"];
        _name = [_name stringByReplacingOccurrencesOfString:@"理由3" withString:@"\n3、"];
        _name = [_name stringByReplacingOccurrencesOfString:@"理由4" withString:@"\n4、"];
        _name = [_name stringByReplacingOccurrencesOfString:@"理由5" withString:@"\n5、"];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, %@", self.name, self.referral, self.imageUrl];
}

@end
