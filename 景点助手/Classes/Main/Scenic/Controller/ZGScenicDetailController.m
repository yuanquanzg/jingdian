//
//  ZGDetailTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGScenicDetailController.h"
#import "MBProgressHUD.h"
#import "ZGScenicTool.h"
#import "ZGPageView.h"
#import "ZGHeaderView.h"
#import "ZGDetailCell.h"
#import "ZGCellectShareView.h"
#import "ZGCollectionModel.h"

#import "ZGWeatherTableController.h"
#import "ZGPriceTableController.h"

@interface ZGScenicDetailController ()<ZGHeaderViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) MBProgressHUD *loadHud;   //加载提示
@property (strong, nonatomic) NSArray *detailArray; //详细数据数组
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) ZGCellectShareView *bottomView; //底部分享与收藏按钮

@end

const static CGFloat imageCellHeight = 200; //图片轮播的高度
const static CGFloat  headerViewHeight = 50;    //三个Button的高度
const static CGFloat  otherCellHeight = 100;    //其他Cell的高度

//const static NSString *fileName = @"cllectionScenic";   //保存收藏景点的文件名称

@implementation ZGScenicDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    [self initData];
   
}

- (void)initData {
    
  
    [self.loadHud setHidden:NO];
    
    [ZGScenicTool detailWithScenicId:_scenicId success:^(NSMutableArray *detailArray) {
        _detailArray = detailArray;
        [self.tableView reloadData];
        [self.loadHud setHidden:YES];
    } failure:^(NSError *error) {
        
    }];
}

- (void)buildView {
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.title = @"景点详情";
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_tableView];
    
    //不显示竖向滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //不显示无数据的cell
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];

    
    //初始化加载提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"努力加载中";
    _loadHud = hud;
    
    ZGCollectionModel *cellocModel = [[ZGCollectionModel alloc]initWithId:self.scenicId imageUrl:self.imageUrl name:self.scenicName];
    _bottomView = [[ZGCellectShareView alloc]initWithCollectionModel:cellocModel fileName:@"cllectionScenic"];
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
    
    if (btn.tag == ZGScenicDetailHeaderViewButtonPrice) {
        ZGPriceTableController *price = [[ZGPriceTableController alloc]init];
        
        //取出景点详情中的最后一张图片，做为priceController中的展示图片
        if (_detailArray.count == 0) {
            price.imageStr = @"";
        }else {
            ZGScenicDetail *detail =   _detailArray[_detailArray.count - 1];
            price.imageStr = detail.imageUrl;
        }
        price.scenicId = self.scenicId;
        [self.navigationController pushViewController:price animated:YES];
    }else if (btn.tag == ZGScenicDetailHeaderViewButtonWeather) {
        ZGWeatherTableController *weather = [[ZGWeatherTableController alloc] init];
        [self.navigationController pushViewController:weather animated:YES];
    }
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
