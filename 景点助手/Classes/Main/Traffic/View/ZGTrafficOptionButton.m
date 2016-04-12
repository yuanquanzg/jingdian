//
//  ZGTrafficOptionButton.m
//  景点助手
//
//  Created by ZZG on 16/4/12.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGTrafficOptionButton.h"

@implementation ZGTrafficOptionButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.bounds = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    self.imageView.center = CGPointMake(self.center.x, self.frame.size.width / 2.0 );
    self.titleLabel.frame = CGRectMake(0, self.frame.size.width, self.frame.size.width, self.frame.size.height - self.frame.size.width);
    
}


@end
