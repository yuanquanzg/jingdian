//
//  ZGCollectView.h
//  景点助手
//
//  Created by ZZG on 16/4/7.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZGCollectionModel;

@interface ZGCollectView : UIView

- (instancetype)initWithCollectionModel:(ZGCollectionModel *)model fileName:(NSString *)fileName;

@end
