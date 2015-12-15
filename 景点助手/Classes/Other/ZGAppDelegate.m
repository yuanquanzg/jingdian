//
//  ZGAppDelegate.m
//  景点助手
//
//  Created by 赵志刚 on 15/11/18.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGAppDelegate.h"
#import "ZGMainTableController.h"
#import "ZGNavigationController.h"
#import "ZGHotelTableController.h"
#import "ZGProvinTableController.h"
#import "ZGWeatherTableController.h"
#import "ZGPriceTableController.h"
#import "ZGHotelTableController.h"

@implementation ZGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //实例化Window
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];

    //便捷方法，去使被使用对象的主窗口显示到屏幕的最前端
    [self.window makeKeyAndVisible];
    
//    ZGMainTableController *main = [[ZGMainTableController alloc]init];
//    ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:main];

//    ZGHotelTableController *hotel = [[ZGHotelTableController alloc]init];
//    ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:hotel];
    
//    ZGProvinTableController *city = [[ZGProvinTableController alloc]init];
//    ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:city];
    
//    ZGWeatherTableController *weather = [[ZGWeatherTableController alloc]init];
//    ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:weather];
    
//    ZGPriceTableController *price = [[ZGPriceTableController alloc]init];
//    ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:price];
    
    ZGHotelTableController *hotel = [[ZGHotelTableController alloc]init];
    ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:hotel];

    
    [self.window setRootViewController:nv];

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
