//
//  ZGImageTool.m
//  景点助手
//
//  Created by ZZG on 15/12/7.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGImageTool.h"
#import "UIImageView+WebCache.h"

@implementation ZGImageTool

+ (UIImageView *)loadImageWithPath:(NSString *)urlStr {
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    UIImageView *imageView = [[UIImageView alloc] init];
                              
    [imageView sd_setImageWithURL:url placeholderImage:nil options:SDWebImageProgressiveDownload];
    
    return imageView;
}
@end
