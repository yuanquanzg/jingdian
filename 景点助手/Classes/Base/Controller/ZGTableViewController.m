//
//  ZGTableViewController.m
//  景点助手
//
//  Created by ZZG on 15/12/10.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGTableViewController.h"
#import "MBProgressHUD.h"
#import "RESideMenu.h"

@interface ZGTableViewController ()


@end

@implementation ZGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化加载提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"努力加载中";
    [hud setHidden:YES];
    _loadHud = hud;

    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setTitle:@"注册" forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"base_item_celan"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 25, 25 );
    //解决自定义UIBarbuttonItem向右偏移的问题
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = rightButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
