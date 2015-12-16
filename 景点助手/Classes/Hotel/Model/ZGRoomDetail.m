//
//  ZGRoomDetail.m
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGRoomDetail.h"

@implementation ZGRoomDetail

- (instancetype)initWithDict:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.name = dict[@"policyName"];
        self.price = dict[@"price"];
        self.breakfast = dict[@"breakfast"];
        self.gift = dict[@"giftsDescription"];
    }
    return self;
}

- (void)setBreakfast:(NSString *)breakfast {
    if (_breakfast.length == 0) {
        if ([breakfast isEqualToString:@""]) {
            _breakfast = @"早餐：无早餐";
        }else {
            _breakfast = [NSString stringWithFormat:@"早餐：%@", breakfast];
        }
    }
    return;
}

- (void)setPrice:(NSString *)price {
    if (_price.length == 0) {
        if ([price isEqualToString:@""]) {
            _breakfast = @"暂无标价";
        }else {
            _price = [NSString stringWithFormat:@"¥%@", price];
        }
    }
    return;
}

- (void)setName:(NSString *)name {
    if (_name.length == 0) {
        if (name.length == 0) {
            _name = @"暂无标题";
        }else {
            _name = name;
        }
    }
}

- (void)setGift:(NSString *)gift {
    if (_gift.length == 0) {
        if (gift.length == 0) {
            _gift = [NSString stringWithFormat:@"福利：暂无福利"];
        }else {
            _gift = [NSString stringWithFormat:@"福利：%@", gift];
            _gift = [_gift stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            _gift = [_gift stringByReplacingOccurrencesOfString:@"\t" withString:@""];
//            NSRange range = [_gift rangeOfString:@"。"];
////            _phoneNumber = [phoneNumber substringWithRange:NSMakeRange(range.location + 2, 12)];
//            _gift = [_gift substringToIndex:range.location];
        }
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name:%@ \t price:%@ \t breakfast:%@ \t gift:%@", self.name, self.price,self.breakfast, self.gift];
}

@end
