//
//  ZGViewController.m
//  景点助手
//
//  Created by ZZG on 16/4/7.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGViewController.h"
#import "ZGErrorView.h"


//#define NetworkErrorNotification @"NetworkError"

@interface ZGViewController ()



@end

@implementation ZGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化加载提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"努力加载中";
    [hud setHidden:YES];
    _loadHud = hud;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showNetworkError) name:@"NetworkError" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 对网络请求出错的处理
- (void)showNetworkError {
    
    [self.loadHud setHidden:YES];
    
    ZGErrorView *errorView = [[ZGErrorView alloc]initWithFrame:self.view.frame];
    [errorView showErrorViewWithType:ZGErrorViewNetworkError];
    [self.view addSubview:errorView];
    
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
////        [_loadHud setHidden:YES];
//
//#warning 此处应做处理，加上一个View提示下拉刷新之类的
//    }];
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"加载失败,请检查网络" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:action];
//    
//    [self presentViewController:alert animated:YES completion:nil];
    
    

}


- (void)addSubview:(UIView *)subview {
    
    if ([self.view.subviews containsObject:_loadHud]) {
        [self.view insertSubview:subview belowSubview:_loadHud];
    }
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
