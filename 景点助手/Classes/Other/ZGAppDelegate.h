//
//  ZGAppDelegate.h
//  景点助手
//
//  Created by 赵志刚 on 15/11/18.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface ZGAppDelegate  : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) BMKMapManager *mapManager;


@end
