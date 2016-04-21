//
//  UIImageView+ZGTool.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "UIImageView+ZGTool.h"
#import "UIImageView+WebCache.h"
#import "Reachability.h"


@implementation UIImageView (ZGTool)

- (void)loadImageWithUrl:(NSString *)url {
    NSUserDefaults *detault = [[NSUserDefaults alloc]init];
    
    BOOL image =[[detault objectForKey:@"imageLoad"] isEqualToString:@"YES"];
    
    BOOL wifi = NO;
    
    Reachability *wifiR = [Reachability reachabilityForLocalWiFi];
    if ([wifiR currentReachabilityStatus] != NotReachable) { // 有wifi
        wifi = YES;
    }
    
    if (image && wifi) {
        NSURL *imageUrl = [NSURL URLWithString:url];
        [self sd_setImageWithURL:imageUrl placeholderImage:nil];

    }else {
        
#warning 设置占位视图
    }

    
}

@end
