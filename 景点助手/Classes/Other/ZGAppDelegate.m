//
//  ZGAppDelegate.m
//  景点助手
//
//  Created by 赵志刚 on 15/11/18.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGAppDelegate.h"
#import "ZGHomeViewController.h"
#import "ZGScenicTableController.h"
#import "ZGNavigationController.h"

#import "RESideMenu.h"

#define BAIDUMAPKEY  @"WuNKYZgeMsoXhN1hnq5c6aLATw7ZZWq0"

@implementation ZGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 要使用百度地图，请先启动BaiduMapManager
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:BAIDUMAPKEY  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    
    //实例化Window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];

    //便捷方法，去使被使用对象的主窗口显示到屏幕的最前端
    [self.window makeKeyAndVisible];
    
    NSUserDefaults *user = [[NSUserDefaults alloc]init];
    NSString *cityName = [user objectForKey:@"cityName"];
    if (cityName.length == 0) {
        [user setObject:@"317" forKey:@"cityId"];
        [user setObject:@"24" forKey:@"provinId"];
        [user setObject:@"西安" forKey:@"cityName"];
    }

    
    ZGScenicTableController *scenic = [[ZGScenicTableController alloc]init];
    ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:scenic];
    ZGHomeViewController *home = [[ZGHomeViewController alloc]init];
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:nv
                                                                    leftMenuViewController:home
                                                                   rightMenuViewController:nil];
    
    
    [self.window setRootViewController:sideMenuViewController];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
