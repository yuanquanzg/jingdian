//
//  ZGHeaderButton.m
//  景点助手
//
//  Created by ZZG on 15/12/10.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGButton.h"

@implementation ZGButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.imageView.bounds = CGRectMake(0, 0, self.frame.size.height - 10, self.frame.size.height - 10);
    self.imageView.center = CGPointMake(self.frame.size.width * 1 / 3.0, self.frame.size.height * 1 / 2.0);
    self.titleLabel.frame = CGRectMake(self.imageView.frame.origin.x + self.imageView.frame.size.width, 0, self.frame.size.width -(self.imageView.frame.origin.x + self.imageView.frame.size.width + 10) , self.frame.size.height);
    
}


@end
