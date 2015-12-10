//
//  UIImageView+ZGTool.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "UIImageView+ZGTool.h"
#import "UIImageView+WebCache.h"


@implementation UIImageView (ZGTool)

- (void)loadImageWithUrl:(NSString *)url {
    
    NSURL *imageUrl = [NSURL URLWithString:url];
    [self sd_setImageWithURL:imageUrl placeholderImage:nil];
}

@end
