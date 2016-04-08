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

@interface ZGTableViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>


@end

@implementation ZGTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化加载提示
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.labelText = @"努力加载中";
//    [hud setHidden:YES];
//    _loadHud = hud;
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self addSubview:_tableView];
    

    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setTitle:@"注册" forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"base_item_celan"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 25, 25 );
    //解决自定义UIBarbuttonItem向右偏移的问题
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(presentLeftMenuViewController:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftButton;

//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showNetworkError) name:@"NetworkError" object:nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

//#pragma mark 对网络请求出错的处理
//- (void)showNetworkError {
//    
//    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//#warning 此处应做处理，加上一个View提示下拉刷新之类的
//    }];
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"加载失败,请检查网络" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    [alert addAction:action];
//    
//    [self presentViewController:alert animated:YES completion:nil];
//    
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
