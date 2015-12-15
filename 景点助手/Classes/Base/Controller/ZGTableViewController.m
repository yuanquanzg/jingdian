//
//  ZGTableViewController.m
//  景点助手
//
//  Created by ZZG on 15/12/10.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGTableViewController.h"
#import "MBProgressHUD.h"

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
