//
//  ZGHotelDetailController.m
//  景点助手
//
//  Created by ZZG on 15/12/14.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelDetailController.h"
#import "ZGHotelTool.h"
#import "ZGHotelDetail.h"
#import "ZGHotelDetailCell.h"
#import "ZGRoomModel.h"
#import "ZGRoomDetail.h"
#import "ZGHotelHeaderView.h"
#import "ZGRoomListCell.h"
#import "ZGBottomView.h"
#import "ZGHotelIntroViewController.h"

@interface ZGHotelDetailController ()<ZGHotelHeaderViewDelegate, ZGHotelDetailCellDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) ZGHotelDetail *hotelDeatil;  //酒店信息
@property (strong, nonatomic) NSMutableArray *roomArray;    //酒店房间信息

@property (strong, nonatomic) MBProgressHUD *loadHud;   //加载提示

@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) ZGBottomView *bottomView; //底部分享与收藏按钮


@end

const static CGFloat KHotelHeaderViewHeight = 95;   //每种房间类型的section中的headerView的高度
const static CGFloat  bottomViewHeight = 50;    //底部收藏和分享的按钮的View的高度
//const static NSString *fileName = @"cllectionHotel";

@implementation ZGHotelDetailController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initData];
    [self buildView];
}

- (void)initData {

    _hotelDeatil = [[ZGHotelDetail alloc]init];

    [self.loadHud setHidden:NO];
    //加载酒店详细信息
    [ZGHotelTool hotelDetailWithId:_hotelId imageUrl:_imageUrl
    success:^(ZGHotelDetail *hotelDeatil) {
        if (hotelDeatil == nil) {
            return ;
        }
        _hotelDeatil = hotelDeatil;
        
    } failure:^(NSError *error) {
        
    }];
    
    //加载酒店房间信息
    [ZGHotelTool roomWithId:_hotelId
    success:^(NSMutableArray *roomArray) {
        if (roomArray.count == 0) {
            [self.loadHud setHidden:YES];
            return ;
        }
        _roomArray = roomArray;
           
        [self.tableView reloadData];
        [self.loadHud setHidden:YES];
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)buildView {
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];

    self.title = @"酒店详情";
    
    //不显示竖向滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //不显示无数据的cell
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    
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
    
    _bottomView = [[ZGBottomView alloc]initWithId:self.hotelId fileName:@"cllectionHotel"];
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
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:@{@"headerViewHeight":[NSNumber numberWithFloat:bottomViewHeight]} views:viewsDic];
    [self.view addConstraints:vCons];

}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger numer;
    if (_roomArray.count == 0) {
        numer = 1;
    }else {
        numer = _roomArray.count + 1;
//        numer = 1;
    }
    return numer;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger number;
    if(section == 0) {
        number = 1;
    }else {
        ZGRoomModel *model = _roomArray[section - 1];
        number = model.isSpread? model.roomArray.count:0;
    }
    return number;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    if (indexPath.section == 0) {
        ZGHotelDetailCell *detailCell = [ZGHotelDetailCell initWithTableView:tableView hotelDetail:_hotelDeatil hotelName:self.hotelName];
        detailCell.delegate = self;
        cell = detailCell;
    }else {
        ZGRoomModel *roomModel = _roomArray[indexPath.section - 1];
        ZGRoomDetail *roomDetail = roomModel.roomArray[indexPath.row];
        cell = [ZGRoomListCell initWithTableView:tableView RoomDetail:roomDetail];
    }
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    CGFloat height;
    
    if (indexPath.section == 0) {
        height = 250 / 375.0 * self.view.frame.size.width;
    }else {
        ZGRoomModel *roomModel = _roomArray[indexPath.section - 1];
        ZGRoomDetail *roomDetail = roomModel.roomArray[indexPath.row];
        height = [ZGRoomListCell heightWithRoomDetail:roomDetail width:self.view.frame.size.width];
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat height;
    if (section == 0) {
        height = 0;
    }else {
        height = KHotelHeaderViewHeight;
    }
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, KHotelHeaderViewHeight)];
    headerView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.7];
    
    ZGHotelHeaderView *view = [[ZGHotelHeaderView alloc]initWithRoomModel:_roomArray[section - 1] section:section - 1];
    view.delegate = self;
    view.frame = CGRectMake(0, 5, self.view.frame.size.width, KHotelHeaderViewHeight - 6);
    [headerView addSubview:view];
    return headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ZGHotelDetailCellDelegate
- (void)clickHotelDetailCellButton:(UIButton *)btn {
    if (btn.tag == ZGHotelDetailCellButtonphone) {
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:_hotelDeatil.phoneNumber style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"%@", _hotelDeatil.phoneNumber);
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"取消拨打：%@", _hotelDeatil.phoneNumber);
        }];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"拨打电话" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:action1];
        [alert addAction:action2];
        
        [self presentViewController:alert animated:YES completion:nil];
        
//        NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",_hotelDeatil.phoneNumber];
//        UIWebView * callWebview = [[UIWebView alloc] init];
//        [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
//        [self.view addSubview:callWebview];
    }else if (btn.tag == ZGHotelDetailCellButtonIntro) {
        NSLog(@"%@", _hotelDeatil.intro);
        ZGHotelIntroViewController *introView = [[ZGHotelIntroViewController alloc]init];
        introView.intro = _hotelDeatil.intro;
        [self.navigationController pushViewController:introView animated:YES];
    }
}

#pragma mark ZGHotelHeaderViewDelegate
- (void)clickHotelHeaderView:(NSInteger)section {
    
    ZGRoomModel *roomModel = _roomArray[section];
    roomModel.isSpread = !roomModel.isSpread;
    
    [self.tableView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
