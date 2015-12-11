//
//  ZGDetailTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGDetailTableController.h"
#import "MBProgressHUD.h"
#import "ZGScenicTool.h"
#import "ZGPageView.h"
#import "ZGHeaderView.h"
#import "ZGDetailCell.h"
#import "ZGBottomView.h"

@interface ZGDetailTableController ()<ZGHeaderViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) MBProgressHUD *loadHud;   //加载提示
@property (strong, nonatomic) NSArray *detailArray; //详细数据数组
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) ZGBottomView *bottomView; //底部分享与收藏按钮

@end

const static CGFloat imageCellHeight = 200; //图片轮播的高度
const static CGFloat  headerViewHeight = 50;    //三个Button的高度
const static CGFloat  otherCellHeight = 100;    //其他Cell的高度

@implementation ZGDetailTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    [self initData];
   
}

- (void)initData {
    
  
    [self.loadHud setHidden:NO];
    
    [ZGScenicTool DetailWithScenicId:_scenicId success:^(NSMutableArray *detailArray) {
        _detailArray = detailArray;
        [self.tableView reloadData];
        [self.loadHud setHidden:YES];
    } failure:^(NSError *error) {
        
    }];
}

- (void)buildView {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.title = @"景点详情";
    
    //初始化加载提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"努力加载中";
    _loadHud = hud;

    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_tableView];
    
    _bottomView = [[ZGBottomView alloc]init];
    _bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_bottomView];
    
    //添加横向约束
    NSDictionary *viewsDic = NSDictionaryOfVariableBindings(_tableView, _bottomView);
    NSString *hVFL1 = @"H:|-0-[_tableView]-0-|";
    NSArray *hCons1= [NSLayoutConstraint constraintsWithVisualFormat:hVFL1 options:0 metrics:nil views:viewsDic];
    [self.view addConstraints:hCons1];
    
    NSString *hVFL2 = @"H:|-0-[_bottomView]-0-|";
    NSArray *hCons2= [NSLayoutConstraint constraintsWithVisualFormat:hVFL2 options:0 metrics:nil views:viewsDic];
    [self.view addConstraints:hCons2];
    
    //添加纵向约束
//    NSDictionary *metrics = NSDictionaryOfVariableBindings([NSNumber numberWithFloat:headerViewHeight]);
    NSString *vVFL = @"V:|-0-[_tableView]-0-[_bottomView(headerViewHeight)]-0-|";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:@{@"headerViewHeight":[NSNumber numberWithFloat:headerViewHeight]} views:viewsDic];
    [self.view addConstraints:vCons];
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

    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [[UITableViewCell alloc]init];
        ZGPageView *pageView = [[ZGPageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)  array:_detailArray];
        [cell addSubview:pageView];
    }else {
        cell = [ZGDetailCell initWithTableView:tableView scenicDetail:_detailArray[indexPath.row]];

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
        height = [ZGDetailCell heightForCellWidthScenicDetail:_detailArray[indexPath.row] width:self.view.frame.size.width];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



////判断滚动位置来使navigationBar透明
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
