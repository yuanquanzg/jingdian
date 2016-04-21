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
    
    BOOL image = [[detault objectForKey:@"imageLoad"] isEqualToString:@"YES"];
    
    // 1.检测wifi状态
    Reachability *wifi = [Reachability reachabilityForLocalWiFi];

    // 2.检测手机是否能上网络(WIFI\3G\2.5G)
    Reachability *conn = [Reachability reachabilityForInternetConnection];

    //状态为Wi-Fi
    if (([wifi currentReachabilityStatus] != NotReachable) && ([conn currentReachabilityStatus] != NotReachable)) {
        NSURL *imageUrl = [NSURL URLWithString:url];
        [self sd_setImageWithURL:imageUrl placeholderImage:[[UIImage imageNamed:@"placeholderImage.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch]];
    //状态为非Wi-Fi但是允许加载
    }else if (image && (([wifi currentReachabilityStatus] == NotReachable) && ([conn currentReachabilityStatus] != NotReachable))) {
        
        NSURL *imageUrl = [NSURL URLWithString:url];
        [self sd_setImageWithURL:imageUrl placeholderImage:[[UIImage imageNamed:@"placeholderImage.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch]];
    }else {
        [self sd_setImageWithURL:nil placeholderImage:[[UIImage imageNamed:@"placeholderImage.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(1, 1, 1, 1) resizingMode:UIImageResizingModeStretch]];
    }

    
}

// 用WIFI
// [wifi currentReachabilityStatus] != NotReachable
// [conn currentReachabilityStatus] != NotReachable

// 没有用WIFI, 只用了手机网络
// [wifi currentReachabilityStatus] == NotReachable
// [conn currentReachabilityStatus] != NotReachable

// 没有网络
// [wifi currentReachabilityStatus] == NotReachable
// [conn currentReachabilityStatus] == NotReachable

@end
