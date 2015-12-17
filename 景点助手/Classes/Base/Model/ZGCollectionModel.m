//
//  ZGCollectionModel.m
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGCollectionModel.h"

@implementation ZGCollectionModel

- (instancetype)initWithId:(NSString *)thingId imageUrl:(NSString *)imageUrl name:(NSString *)thingName {
    self = [super init];
    if (self) {
        self.thingId = thingId;
        self.imageUrl = imageUrl;
        self.thingName = thingName;
    }
    return self;
}

- (NSString *)description {
    [super description];
    
    return [NSString stringWithFormat:@"id:%@   imageUrl:%@   name:%@", self.thingId, self.imageUrl, self.thingName];
}

//属性变量分别转码
- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.thingId forKey:@"thingId"];
    [aCoder encodeObject:self.imageUrl forKey:@"imageUrl"];
    [aCoder encodeObject:self.thingName forKey:@"thingName"];
}
//分别把属性变量根据关键字进行逆转码，最后返回一个类的对象
- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.thingId = [aDecoder decodeObjectForKey:@"thingId"];
        self.imageUrl= [aDecoder decodeObjectForKey:@"imageUrl"];
        self.thingName = [aDecoder decodeObjectForKey:@"thingName"];
    }
    return self;
}

@end
