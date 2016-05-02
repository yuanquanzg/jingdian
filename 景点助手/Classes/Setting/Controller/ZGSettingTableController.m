//
//  ZGSettingTableController.m
//  景点助手
//
//  Created by ZZG on 15/12/17.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGSettingTableController.h"
#import "ZGNavigationController.h"
#import "ZGTeamViewController.h"
#import "ZGAboutViewController.h"

@interface ZGSettingTableController ()

@property (strong, nonatomic) UISwitch *imageSwitch;
@property (strong, nonatomic) UISwitch *dataSwitch;

@end

@implementation ZGSettingTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
    [self initData];
}

- (void)initData {
    
}

- (void)buildView {
    
    self.title = @"设置";
    
    _imageSwitch = [[UISwitch alloc]init];
    [_imageSwitch addTarget:self action:@selector(imageSwitch:) forControlEvents:UIControlEventValueChanged];
  
//    [_imageSwitch setOn:YES];
    
    _dataSwitch = [[UISwitch alloc]init];
    [_dataSwitch addTarget:self action:@selector(dataSwitch:) forControlEvents:UIControlEventValueChanged];
    [_dataSwitch setOn:YES];
    
    NSUserDefaults *detault = [[NSUserDefaults alloc]init];
    if ([[detault objectForKey:@"imageLoad"] isEqualToString:@"YES"]) {
        [_imageSwitch setOn:YES];
    }else {
        [_imageSwitch setOn:NO];
    }
    
    if ([[detault objectForKey:@"dataLoad"] isEqualToString:@"YES"]) {
        [_dataSwitch setOn:YES];
    }else {
        [_dataSwitch setOn:NO];
    }
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.section == 0) {
        [cell.textLabel setText:@"非Wi-Fi加载数据"];
        cell.accessoryView = _dataSwitch;
    }else if (indexPath.section == 1) {
        [cell.textLabel setText:@"非Wi-Fi加载图片"];
        cell.accessoryView = _imageSwitch;
    }else if (indexPath.section == 2) {
        [cell.textLabel setText:@"开发声明"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if (indexPath.section == 3) {
        [cell.textLabel setText:@"关于软件"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
 
    CGFloat height = 0;
    if (section == 0) {
        height = 20;
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    CGFloat height = 20;
//    if (section != 0) {
//        height = 20;
//    }
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2) {
        
        ZGTeamViewController *team = [[ZGTeamViewController alloc]init];
        ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:team];
        [self presentViewController:nv animated:YES completion:nil];
        
    } else if (indexPath.section == 3) {
        
        ZGAboutViewController *about = [[ZGAboutViewController alloc]init];
//        ZGNavigationController *nv = [[ZGNavigationController alloc]initWithRootViewController:about];
        [self presentViewController:about animated:YES completion:nil];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)imageSwitch:(UISwitch *)imageSwitch {
    
    NSUserDefaults *detault = [[NSUserDefaults alloc]init];

    if (imageSwitch.on) {
        [detault setObject:@"YES" forKey:@"imageLoad"];
    }else {
        [detault setObject:@"NO" forKey:@"imageLoad"];
    }
}

- (void)dataSwitch:(UISwitch *)dataSwitch {
    
    NSUserDefaults *detault = [[NSUserDefaults alloc]init];
    
    if (dataSwitch.on) {
        [detault setObject:@"YES" forKey:@"dataLoad"];
    }else {
        [detault setObject:@"NO" forKey:@"dataLoad"];
    }

}

@end
