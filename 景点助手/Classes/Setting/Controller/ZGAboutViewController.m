//
//  ZGAboutViewController.m
//  景点助手
//
//  Created by ZZG on 16/4/21.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGAboutViewController.h"
#import "ZGSetPageView.h"

@interface ZGAboutViewController ()

@end

@implementation ZGAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self buildView];
}

- (void)buildView {
    
    self.title = @"关于软件";
    
    ZGSetPageView *page = [[ZGSetPageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:page];
    
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"placeholderImage.png"]]];
//    
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    //    [backButton setTitle:@"注册" forState:UIControlStateNormal];
//    [backButton setImage:[UIImage imageNamed:@"setting_cancle"] forState:UIControlStateNormal];
//    backButton.frame = CGRectMake(0, 0, 25, 25 );
//    //解决自定义UIBarbuttonItem向右偏移的问题
//    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
//    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
//    self.navigationItem.leftBarButtonItem = leftButton;
//    
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    
    
    UIView *navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, CGRectGetWidth(self.view.bounds), 44)];
    [navigationView setBackgroundColor:[UIColor clearColor]];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"setting_cancle"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(10, 0, 25, 25 );
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [navigationView addSubview:backButton];
    [self.view addSubview:navigationView];
    
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
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
