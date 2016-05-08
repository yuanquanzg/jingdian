//
//  UIColor+Image.m
//  景点助手
//
//  Created by ZZG on 16/5/8.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "UIColor+Image.h"

@implementation UIColor (Image)

+ (UIColor *)imageColor {
    
    NSUserDefaults *detault = [[NSUserDefaults alloc]init];
    
    BOOL image = [[detault objectForKey:@"imageLoad"] isEqualToString:@"YES"];
    UIColor *imageColor;
    
    if (image) {
        imageColor = [UIColor whiteColor];
    }else {
        imageColor = [UIColor blackColor];
    }
    
    return imageColor;
}

@end
