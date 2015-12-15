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

@interface ZGHotelDetailController ()

@property (strong, nonatomic) ZGHotelDetail *hotelDeatil;  //酒店信息
@property (strong, nonatomic) NSMutableArray *roomArray;    //酒店房间信息

@end

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
//    [self.view setBackgroundColor:[UIColor blackColor]];
    
//    [self.navigationController.navigationBar setTintColor:[UIColor clearColor]];
    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hotel_cell_accessoryView"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
