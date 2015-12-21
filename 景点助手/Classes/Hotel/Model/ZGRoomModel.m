//
//  ZGRoomModel.m
//  景点助手
//
//  Created by ZZG on 15/12/15.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGRoomModel.h"
#import "ZGRoomDetail.h"

@implementation ZGRoomModel


- (instancetype)initWithDic:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.imageName = [NSString stringWithFormat:@"room_%d.jpg",   (arc4random() % 10) + 1];
        self.isSpread = NO;
        self.area = dict[@"area"];
        self.bed = dict[@"bed"];
        self.roomName = dict[@"roomName"];
        self.roomArray = [NSMutableArray array];
        for (NSDictionary *dic in dict[@"policyInfo"]) {
            ZGRoomDetail *room = [[ZGRoomDetail alloc]initWithDict:dic];
            [self.roomArray addObject:room];
        }
    }
    return self;
}

- (void)setArea:(NSString *)area {
    if (_area.length == 0) {
        if (area.length == 0) {
            _area = [NSString stringWithFormat:@"暂无大小说明"];
        }else {
            _area = [NSString stringWithFormat:@"%@m²", area];
            if ([_area containsString:@"平方米"]) {
                _area = [_area stringByReplacingOccurrencesOfString:@"平方米" withString:@""];
            }
        }
    }
    return;
}


-(void)setBed:(NSString *)bed {
    if (_bed.length == 0) {
        if (bed.length == 0) {
            _bed = @"大床";
        }else {
            _bed = bed;
        }
    }
    return;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"isSpread:%d \t area:%@ \t bed:%@ \t roomName:%@ \t roomArray:%@", self.isSpread, self.area, self.bed, self.roomName, self.roomArray];
}

@end
