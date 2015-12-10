//
//  ZGDetailTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGDetailTableController.h"
#import "ZGScenicTool.h"
#import "MBProgressHUD.h"
#import "ZGPageView.h"
#import "ZGHeaderView.h"

@interface ZGDetailTableController ()<ZGHeaderViewDelegate>

@property (strong, nonatomic) MBProgressHUD *loadHud;   //加载提示
@property (strong, nonatomic) NSArray *detailArray; //详细数据数组

@end

const static CGFloat imageCellHeight = 200; //图片轮播的高度
const static CGFloat  headerViewHeight = 50;    //三个Button的高度
const static CGFloat  otherCellHeight = 100;    //其他Cell的高度

@implementation ZGDetailTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self buildView];
}

- (void)initData {
    
    [_loadHud setHidden:NO];
    [ZGScenicTool DetailWithScenicId:_scenicId success:^(NSMutableArray *detailArray) {
        _detailArray = detailArray;
        [self.tableView reloadData];
        [_loadHud setHidden:YES];
    } failure:^(NSError *error) {
        
    }];
}

- (void)buildView {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //初始化加载提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"努力加载中";
    _loadHud = hud;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger number;
    if (section == 0) {
        number = 1;
    }else {
        number = _detailArray.count;
    }
    return number;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //NSLog(@"%ld", indexPath.section);
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section == 0) {
        ZGPageView *pageView = [[ZGPageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)  array:_detailArray];
        [cell addSubview:pageView];
    }
    
    // Configure the cell...
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ZGHeaderView *headerView = [[ZGHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, headerViewHeight)];
    [headerView setDelegate:self];
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = otherCellHeight;
    if (indexPath.section == 0) {
        height = imageCellHeight;
    }else {
        height = otherCellHeight;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = 0;
    if (section == 0) {
        height = 0;
    }else {
        height = headerViewHeight;
    }
    return height;
}

#pragma mark -- ZGHeaderViewDelegate
- (void)clickHeaderButton:(UIButton *)btn {
    
}

//判断滚动位置来使navigationBar透明
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%@", NSStringFromCGPoint(self.tableView.contentOffset));
//    if (self.tableView.contentOffset.y >= -10) {
//        [UIView animateWithDuration:0 animations:^{
//            [self.navigationController.navigationBar setAlpha:0];
//        }];
//    }else {
//        [UIView animateWithDuration:1.0 animations:^{
//            [self.navigationController.navigationBar setAlpha:1];
//        }];
//    }
//}
@end
