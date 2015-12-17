//
//  ZGMainTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/7.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGScenicTableController.h"
#import "ZGScenicTool.h"
#import "ZGScenicCell.h"
#import "ZGScenicSimple.h"
#import "MJRefresh.h"
#import "ZGScenicDetailController.h"
#import "ZGDataTool.h"

@interface ZGScenicTableController ()

@property (strong, nonatomic) UISegmentedControl *titleSegment; //导航栏的titileView
@property (strong, nonatomic) UITableView *contentView; //内容列表

@property (strong, nonatomic) NSMutableArray *scenicArray;  //请求返回的景点数据

@property (assign, nonatomic) NSInteger page;   //请求页数

@end

@implementation ZGScenicTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self buildView];
}

- (void)initData {
    _scenicArray = [NSMutableArray array];
    
    _page = 1;
    
    [self.loadHud setHidden:NO];
    
    [ZGScenicTool scenicWithPage:_page success:^(NSMutableArray *scenicArray) {
        //如果返回的数组的元素个数位为0，则提示没有数据
        if (scenicArray.count == 0) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
            [self.loadHud setHidden:YES];
            return;
        }
        
        _scenicArray = scenicArray;
        _page++;
        [self.tableView reloadData];
        [self.loadHud setHidden:YES];
     } failure:^(NSError *error) {
        [self.loadHud setHidden:YES];
    }];
}

- (void)buildView {
    
//    [self.view setBackgroundColor:[UIColor blackColor]];

    self.title = @"景点";
    
    //解决tableView顶部被NavigationBar遮盖的问题
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //不显示竖向滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //解决显示多余cell的问题
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    //集成MJRefresh的上拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];

     
    //初始化navigationBar上的segementControl
    _titleSegment = [[UISegmentedControl alloc]initWithItems:@[@"推荐", @"所有"]];
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
}

#pragma mark ---SegmentValueChanged
- (void)selectSegmentChange:(UISegmentedControl *)segment {
    if (segment.selectedSegmentIndex == 0) {
        [self.tableView.mj_footer resetNoMoreData];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }else {
        [self.tableView.mj_footer resetNoMoreData];
    }
    //切换segment的时候，自动跳到tableView的头部
    [self.tableView setContentOffset:CGPointMake(0, 0)];
    [self.tableView reloadData];
}


#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger number = 10;
    if (_scenicArray.count == 0) {
        number = 0;
    }else {
        if (_titleSegment.selectedSegmentIndex == 0) {
            number = 10;
            if (_scenicArray.count < 10) {
                number = _scenicArray.count;
            }
        }else {
            number = _scenicArray.count;
        }
    }
      return number;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 1;
    if (_scenicArray.count == 0) {
        count = 0;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZGScenicSimple *simpleModel = _scenicArray[indexPath.section];
    ZGScenicCell *cell = [ZGScenicCell initWithTableView:self.tableView scenicSimple:simpleModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height = 10;
    if (section == 0) {
        height = 0;
    }
    return height;
}

//Cell点击方法,进入详情页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZGScenicSimple *scenic = _scenicArray[indexPath.section];
    
    ZGScenicDetailController *detail = [[ZGScenicDetailController alloc]init];
    detail.scenicId = scenic.scenicId;
    detail.imageUrl = scenic.imageUrl;
    detail.scenicName = scenic.name;
    [self.navigationController pushViewController:detail animated:YES];
//    [self presentViewController:detail animated:YES completion:nil];
 
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

#pragma mark -- MJRefresh
- (void)loadMoreData {
    if (_titleSegment.selectedSegmentIndex == 0) {
        [self.tableView.mj_footer endRefreshing];
        return;
    }else {
        [self.tableView.mj_footer beginRefreshing];
        [ZGScenicTool scenicWithPage:_page success:^(NSMutableArray *scenicArray) {
            //如果返回的数组的元素个数位为0，则提示没有数据
            if (scenicArray.count == 0) {
                [self.tableView.mj_footer endRefreshingWithNoMoreData];
                return;
            }
            [_scenicArray addObjectsFromArray:scenicArray];
            [self.tableView reloadData];
            _page++;
            [self.tableView.mj_footer endRefreshing];
            return;
        } failure:^(NSError *error) {
            
        }];
    }
}

@end
