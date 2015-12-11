//
//  ZGProvinTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/11.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGProvinTableController.h"
#import "ZGCityTool.h"
#import "ZGCityModel.h"
#import "ZGCityTableController.h"

@interface ZGProvinTableController ()

@property (strong, nonatomic) NSArray *dataArray;
@property (strong, nonatomic) NSMutableArray *provinArray;

@end

@implementation ZGProvinTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self buildView];
}

- (void)initData {
    
    _provinArray = [NSMutableArray array];

    [self.loadHud setHidden:NO];
    
    [ZGCityTool CityWithSuccess:^(NSMutableArray *dataArray) {
        if (dataArray.count == 0) {
            [self.loadHud setHidden:YES];
            return;
        }
        self.dataArray = dataArray;
        [self handleData:dataArray];
        [self.loadHud setHidden:YES];
        [self.tableView reloadData];
        NSLog(@"tableVIew:%@", self.tableView);
    } failure:^(NSError *error) {
        [self.loadHud setHidden:YES];
    }];
}


- (void)handleData:(NSArray *)dataArray {
    
    for (ZGCityModel *city in dataArray) {
        if ([city.cityId isEqualToString:city.provinId] ) {
            [_provinArray addObject:city];
        }
    }
}

- (void)buildView {
    
    self.title = @"选择城市";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _provinArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cityCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    ZGCityModel *city = _provinArray[indexPath.row];
    [cell.textLabel setText:city.cityName];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray *cityArray = [NSMutableArray array];
    ZGCityModel *provin = _provinArray[indexPath.row];
    NSString *pid = provin.provinId;
    for (ZGCityModel *city in _dataArray) {
        if ([city.provinId isEqualToString: pid] ) {
            [cityArray addObject:city];
        }
    }
    
    ZGCityTableController *cityTableController = [[ZGCityTableController alloc]initWithCityArray:cityArray];
    [self.navigationController pushViewController:cityTableController animated:YES];
    
//    NSUserDefaults *detault = [[NSUserDefaults alloc]init];
//    [detault setObject:city.cityId forKey:@"cityId"];
//    [detault setObject:city.provinId forKey:@"provinId"];
//    [detault setObject:city.cityName forKey:@"cityName"];
}

@end
