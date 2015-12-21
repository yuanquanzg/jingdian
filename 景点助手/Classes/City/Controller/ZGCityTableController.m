//
//  ZGCityTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/10.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGCityTableController.h"
#import "ZGCityModel.h"
#import "ZGHomeMenuView.h"
#import "RESideMenu.h"

@interface ZGCityTableController ()

@property (strong, nonatomic) NSArray *cityArray;

@property (strong, nonatomic) UIButton *btn;

@end

@implementation ZGCityTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (instancetype)initWithCityArray:(NSMutableArray *)cityArray button:(UIButton *)button{
    self = [super init];
    if (self) {
        self.cityArray = cityArray;
        ZGCityModel *city = cityArray[0];
        self.title  = city.cityName;
        
        _btn = button;
    }
    return  self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cityArray.count -1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    ZGCityModel *city = _cityArray[indexPath.row + 1];
    [cell.textLabel setText:city.cityName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ZGCityModel *city = _cityArray[indexPath.row + 1];
    NSUserDefaults *detault = [[NSUserDefaults alloc]init];
    [detault setObject:city.cityId forKey:@"cityId"];
    [detault setObject:city.provinId forKey:@"provinId"];
    [detault setObject:city.cityName forKey:@"cityName"];

    [_btn setTitle:[NSString stringWithFormat:@"\t%@", city.cityName] forState:UIControlStateNormal];
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self performSelector:@selector(presentLeftMenuViewController:) withObject:nil afterDelay:0];
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
