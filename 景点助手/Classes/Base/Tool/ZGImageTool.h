//
//  ZGImageTool.h
//  景点助手
//
//  Created by ZZG on 15/12/7.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIImageView+WebCache.h"

@interface ZGImageTool : NSObject

+ (UIImageView *)loadImageWithPath:(NSString *)urlStr;

@end
