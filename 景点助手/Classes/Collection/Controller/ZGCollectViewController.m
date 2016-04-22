//
//  ZGCollectViewController.m
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGCollectViewController.h"
#import "MBProgressHUD.h"
#import "ZGCollectionTool.h"
#import "ZGCollectionCell.h"
#import "ZGScenicDetailController.h"
#import "ZGHotelDetailController.h"
#import "ZGCollectionModel.h"
#import "RESideMenu.h"

@interface ZGCollectViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UISegmentedControl *titleSegment; //导航栏的titileView
@property (strong, nonatomic) MBProgressHUD *loadHud;   //加载提示

@property (strong, nonatomic) UITableView *scenicTableView;
@property (strong, nonatomic) NSMutableArray *scenicArray;

@property (strong, nonatomic) UITableView *hotelTableView;
@property (strong, nonatomic) NSMutableArray *hotelArray;

@end


const static CGFloat KCollectionCellHeight = 80.0;
const static CGFloat KCollectionHeaderViewHeight = 10.0;

@implementation ZGCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    [self initData];
}

- (void)initData {
//    if (_titleSegment.selectedSegmentIndex == 0) {
//            [ZGCollectionTool dataWithFileName:<#(NSString *)#>];
//    }
}

- (void)buildView {
    
    self.title = @"收藏";
    
    _scenicTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _scenicTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    _scenicTableView.delegate = self;
    _scenicTableView.dataSource = self;
    
    _hotelTableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _hotelTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    _hotelTableView.dataSource = self;
    _hotelTableView.delegate = self;
    
    //初始化加载提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"努力加载中";
    _loadHud = hud;
    
    //初始化navigationBar上的segementControl
    _titleSegment = [[UISegmentedControl alloc]initWithItems:@[@"景点", @"酒店"]];
    [_titleSegment setTintColor:[UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:0.5]];
    _titleSegment.frame = CGRectMake(0, 0, self.view.bounds.size.width * 0.5, 30);
    //文字设置
    NSMutableDictionary *attDic = [NSMutableDictionary dictionary];
    attDic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:16];
    attDic[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [_titleSegment setTitleTextAttributes:attDic forState:UIControlStateNormal];
    [_titleSegment setTitleTextAttributes:attDic forState:UIControlStateSelected];
    //事件
    [_titleSegment addTarget:self action:@selector(selectSegmentChange:) forControlEvents:UIControlEventValueChanged];
    //此处需要使用两遍selectSegmentChange
    [self selectSegmentChange:_titleSegment];
    [_titleSegment setSelectedSegmentIndex:0];
    [self selectSegmentChange:_titleSegment];
    
    self.navigationItem.titleView = _titleSegment;
  
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

- (void)selectSegmentChange:(UISegmentedControl *)segment {
 
    if (segment.selectedSegmentIndex == 0) {
        [_hotelTableView removeFromSuperview];
        [self.view addSubview:_scenicTableView];
    } else if (segment.selectedSegmentIndex == 1) {
        [_scenicTableView removeFromSuperview];
        [self.view addSubview:_hotelTableView];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    _scenicArray = [ZGCollectionTool dataWithFileName:@"cllectionScenic"];
    _hotelArray = [ZGCollectionTool dataWithFileName:@"cllectionHotel"];
    
    if (_titleSegment.selectedSegmentIndex == 0) {
        [_scenicTableView reloadData];
    }else if (_titleSegment.selectedSegmentIndex == 1) {
        [_hotelTableView reloadData];
    }
}

#pragma mark UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSInteger number;
    
    if (tableView == _scenicTableView) {
        number = _scenicArray.count;
    }else if (tableView == _hotelTableView) {
        number = _hotelArray.count;
    }
    
    return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ZGCollectionCell *cell;
    
    if (tableView == _scenicTableView) {
        cell = [ZGCollectionCell initWithTableView:tableView collectionModel:_scenicArray[indexPath.section]];
    }else {
        cell = [ZGCollectionCell initWithTableView:tableView collectionModel:_hotelArray[indexPath.section]];
    }
 
    return cell;
}

#pragma mark UITableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return KCollectionCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = KCollectionHeaderViewHeight;
    if (section != 0) {
        height = 0;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
 
    return KCollectionHeaderViewHeight;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _scenicTableView) {
        
        ZGCollectionModel *model = _scenicArray[indexPath.section];
        
        ZGScenicDetailController *scenicDetail = [[ZGScenicDetailController alloc]init];
        scenicDetail.scenicId = model.thingId;
        scenicDetail.scenicName = model.thingName;
        scenicDetail.imageUrl = model.imageUrl;
        [self.navigationController pushViewController:scenicDetail animated:YES];
        
    }else if (tableView == _hotelTableView) {
        ZGCollectionModel *model = _hotelArray[indexPath.section];
        
        ZGHotelDetailController *hotelDetail = [[ZGHotelDetailController alloc]init];
        hotelDetail.hotelId = model.thingId;
        hotelDetail.hotelName = model.thingName;
        hotelDetail.imageUrl = model.imageUrl;
        [self.navigationController pushViewController:hotelDetail animated:YES];
        
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
