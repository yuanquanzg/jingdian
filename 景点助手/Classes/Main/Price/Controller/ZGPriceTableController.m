//
//  ZGPriceTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGPriceTableController.h"
#import "ZGPriceTool.h"
#import "ZGPriceCell.h"
#import "UIImageView+ZGTool.h"
#import "MBProgressHUD.h"


@interface ZGPriceTableController ()

@property (strong, nonatomic) NSMutableArray *priceArray;

//@property (strong, nonatomic) MBProgressHUD *loadHud;

@end

const static CGFloat   KheaderViewHeight = 200;

@implementation ZGPriceTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    [self initData];
}

- (void)initData {
    _priceArray = [NSMutableArray array];
    
    [self.loadHud setHidden:NO];
    [ZGPriceTool priceWithScenicId:self.scenicId success:^(NSMutableArray *priceArray) {
        if (priceArray.count == 0) {
            [self.loadHud setHidden:YES];
            return;
        }
        _priceArray = priceArray;
        [self.tableView reloadData];
        [self.loadHud setHidden:YES];
    } failure:^(NSError *error) {
        
    }];
}

- (void)buildView {
    
    self.tableView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64);
    
    //不显示竖向滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //不显示无数据的cell
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    self.title = @"票价";
    
    //初始化加载提示
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.labelText = @"努力加载中";
//    [hud setHidden:YES];
//    _loadHud = hud;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [backButton setTitle:@"注册" forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"setting_cancle"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 25, 25 );
    //解决自定义UIBarbuttonItem向右偏移的问题
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger number;
    if (_priceArray.count == 0) {
        number = 0;
    }else {
        number = _priceArray.count;
    }
    return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
 }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KheaderViewHeight)];
        [imageView loadImageWithUrl:self.imageStr];
        [cell addSubview:imageView];
    }else {
      cell = [ZGPriceCell initWithTableView:tableView priceModel:_priceArray[indexPath.section]];

    }
     return cell;
}


#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height;
    if (section == 0) {
        height = 0;
    }else {
        height = 10;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height;
    if (indexPath.section == 0) {
        height = KheaderViewHeight;
    }else {
        height = [ZGPriceCell heightForCellWithPriceModel:_priceArray[indexPath.section] width:self.view.frame.size.width];
    }
    return height;
}

// 去掉UItableview headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat sectionHeaderHeight = 40;
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    }
    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
