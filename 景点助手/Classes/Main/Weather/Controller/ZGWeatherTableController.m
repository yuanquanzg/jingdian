//
//  ZGWeatherTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/12.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGWeatherTableController.h"
#import "ZGWeatherTool.h"
#import "ZGTodayCell.h"
#import "ZGFutureCell.h"
#import "ZGTodayDetailCell.h"
#import "ZGAdviceCell.h"
#import "MBProgressHUD.h"

@interface ZGWeatherTableController ()

@property (strong, nonatomic) NSMutableArray *weatherArray;    //天气状况数组

@property (strong, nonatomic) MBProgressHUD *loadHud;

@end

@implementation ZGWeatherTableController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self buildView];
    [self initData];
}


- (void)initData {
    
    _weatherArray = [NSMutableArray array];
    
    [self.loadHud setHidden:NO];
    [ZGWeatherTool weatherWithCity:nil success:^(NSMutableArray *weatherArray) {
        
        if (weatherArray.count == 0) {
            [self.loadHud setHidden:YES];
            return;
        }
        
        _weatherArray = weatherArray;
        [self.tableView reloadData];
        [self.loadHud setHidden:YES];
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)buildView {
    //不显示竖向滑动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //不显示无数据的cell
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    self.title = @"天气";
    
    //初始化加载提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"努力加载中";
    [hud setHidden:YES];
    _loadHud = hud;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger number;
    if (_weatherArray.count != 0) {
        number = 7;
    }else {
        number = 0;
    }
    return number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    
    if (indexPath.row == 0) {
        cell = [[ZGTodayCell alloc]initWithWeather:_weatherArray[indexPath.row]];
    }else if (indexPath.row == 5 ) {
        cell = [[ZGTodayDetailCell alloc]initWithWeather:_weatherArray[0]];
    }else if (indexPath.row == 6) {
        cell = [[ZGAdviceCell alloc]initWithWeather:_weatherArray[0]];
    }else {
        cell = [[ZGFutureCell alloc]initWithWeather:_weatherArray[indexPath.row]];
    }
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = 44;
    if (indexPath.row == 0) {
        height = 180;
    }else if (indexPath.row == 5) {
        height = 200;
    }else if (indexPath.row == 6) {
        height = 60;
    }
    
    return height;
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
