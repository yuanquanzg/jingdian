//
//  ZGNavigationController.m
//  景点助手
//
//  Created by ZZG on 15/12/6.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGNavigationController.h"

@interface ZGNavigationController ()

@end

@implementation ZGNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

      //修改全局navigationBar的颜色
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bar_backgroundImage_deselect.png"] forBarMetrics:UIBarMetricsDefault];
    
    //修改全局navigationBar标题字体颜色
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                  NSForegroundColorAttributeName : [UIColor whiteColor]
                                  }];
    
    //修改全局navigationBar返回按钮字体颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
}


//设置状态栏的（亮色）白色
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
