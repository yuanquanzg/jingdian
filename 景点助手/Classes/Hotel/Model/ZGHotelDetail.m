//
//  ZGHotelDetail.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelDetail.h"

@implementation ZGHotelDetail

- (instancetype) initWithDic:(NSDictionary *)dict iamgeUrl:(NSString *)imageUrl {
    self = [super init];
    if (self) {
        self.imageUrl = imageUrl;
        self.intro = dict[@"intro"];
        self.phoneNumber = dict[@"basic"];
    }
    return self;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    if (_phoneNumber.length == 0) {
        NSRange range = [phoneNumber rangeOfString:@"电话"];
        _phoneNumber = [phoneNumber substringWithRange:NSMakeRange(range.location + 2, 12)];
    }
}

- (NSString *)description {
    return  [NSString stringWithFormat:@"%@, %@, %@", self.intro, self.phoneNumber, self.imageUrl];
}

@end
