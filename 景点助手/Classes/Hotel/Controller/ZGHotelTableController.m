//
//  ZGHotelTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/8.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelTableController.h"
#import "ZGHotelTool.h"
#import "ZGHotelListCell.h"
#import "MJRefresh.h"
#import "ZGHotelModel.h"
#import "ZGHotelDetailController.h"

@interface ZGHotelTableController ()

@property (strong, nonatomic) NSMutableArray *hotelArray;
@property (assign, nonatomic) NSInteger page;

@end

@implementation ZGHotelTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self buildView];
}

- (void)initData {
    _page = 1;
    
    _hotelArray  = [NSMutableArray array];
    
    [self.loadHud setHidden:NO];
    [ZGHotelTool hotelListWithPage:_page
    success:^(NSMutableArray *hotelArray) {
        
        if (hotelArray.count == 0) {
            [self.loadHud setHidden:YES];
            return;
        }
        self.hotelArray = hotelArray;
        _page++;
        [self.loadHud setHidden:YES];
        [self.tableView reloadData];

    } failure:^(NSError *error) {
        
    }];
}

- (void)buildView {
    self.title = @"酒店";
    
    //集成MJRefresh的上拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger number;
    if (_hotelArray.count == 0) {
        number = 0;
    }else {
        number = _hotelArray.count;
    }
    return number;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ZGHotelListCell *cell = [ZGHotelListCell initWithTableView:tableView priceModel:_hotelArray[indexPath.row]];
    return cell;
}

#pragma  mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZGHotelDetailController *detail =  [[ZGHotelDetailController alloc]init];
    ZGHotelModel *hotel = _hotelArray[indexPath.row];
    detail.hotelId = hotel.hotelId;
    detail.imageUrl = hotel.hotelImage;
    detail.hotelName = hotel.hotelName;
    [self.navigationController pushViewController:detail animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -- MJRefresh
- (void)loadMoreData {
    [ZGHotelTool hotelListWithPage:_page success:^(NSMutableArray *hotelArray) {
        //如果返回的数组的元素个数位为0，则提示没有数据
        if (hotelArray.count == 0) {
            [self.tableView.mj_footer endRefreshing];
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            return;
        }
        [_hotelArray addObjectsFromArray:hotelArray];
        [self.tableView reloadData];
        _page++;
        [self.tableView.mj_footer endRefreshing];
        return;
    } failure:^(NSError *error) {
        
    }];
}


@end
