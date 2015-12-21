//
//  ZGHomeViewController.m
//  景点助手
//
//  Created by ZZG on 15/12/17.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHomeViewController.h"
#import "ZGHomeMenuView.h"
#import "RESideMenu.h"

#import "ZGNavigationController.h"
#import "ZGProvinTableController.h"
#import "ZGScenicTableController.h"
#import "ZGHotelTableController.h"
#import "ZGCollectViewController.h"
#import "ZGSettingTableController.h"

@interface ZGHomeViewController ()<ZGHomeMenuViewDelegate, RESideMenuDelegate>

@property (strong, nonatomic) ZGHomeMenuView *homeMenuView;

@property (strong, nonatomic) NSArray *childNameArray;

@end

@implementation ZGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    ZGScenicTableController *secnic = [[ZGScenicTableController alloc]init];
//    ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:secnic];
//    [self addChildViewController:nv];
//    [self.view addSubview:nv.view];
    
    [self buildView];
}

- (void)buildView {
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_view_background4.jpeg"]];
    imageView.userInteractionEnabled = YES;
    imageView.frame = self.view.frame;
    self.view = imageView;
    
    _childNameArray = @[@"ZGProvinTableController", @"ZGScenicTableController", @"ZGHotelTableController", @"ZGCollectViewController", @"ZGSettingTableController"];
    
    //初始化左边的MenuView
    _homeMenuView = [[ZGHomeMenuView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.6, self.view.frame.size.height)];
    _homeMenuView.delegate = self;
    [self.view insertSubview:_homeMenuView atIndex:1];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_homeMenuView cityChanged];
}

#pragma mark ZGHomeMenuViewDelegate
- (void)homeMenuViewButtonClcikFrom:(ZGHomeMenuViewButtonType)fromIndex to:(ZGHomeMenuViewButtonType)toIndex {
    
    
    if (toIndex == ZGHomeMenuViewButtonCity) {
        
        ZGProvinTableController *province = [[ZGProvinTableController alloc]initWithButton:(UIButton *)_homeMenuView.cityButton];
        
        [self.sideMenuViewController setContentViewController:[[ZGNavigationController alloc]initWithRootViewController:province] animated:YES];
        [self.sideMenuViewController hideMenuViewController];
        
    }else {
        
        [self.sideMenuViewController setContentViewController:[[ZGNavigationController alloc] initWithRootViewController:(UIViewController *)[[NSClassFromString(_childNameArray[toIndex]) alloc] init]] animated:YES];
        [self.sideMenuViewController hideMenuViewController];

    }
     
}


//设置状态栏的（亮色）白色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
