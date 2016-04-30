//
//  ZGHotelIntroViewController.m
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelIntroViewController.h"
#import "ZGHotelIntroTextView.h"

@interface ZGHotelIntroViewController ()

@property (strong, nonatomic) UITextView *introTextView;

@end

@implementation ZGHotelIntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildView];
}

- (void)buildView {
    
    self.title = @"酒店简介";
    
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"placeholderImage.png"]]];

    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"hoteIntro_bg.jpeg"]]];

    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [backButton setTitle:@"注册" forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"setting_cancle"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 25, 25 );
    //解决自定义UIBarbuttonItem向右偏移的问题
    backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftButton;

    
    _introTextView = [[ZGHotelIntroTextView alloc]init];
    
    [_introTextView.layer setMasksToBounds:YES];
    [_introTextView.layer setCornerRadius:10.0f];
    [_introTextView.layer setBorderWidth:0.5f];
    [_introTextView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
//    [_introTextView setTextColor:[UIColor whiteColor]];
    [_introTextView setBackgroundColor:[UIColor clearColor]];
    
    _introTextView.text = _intro;
    //景点性情位置
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    //    style.alignment = NSTextAlignmentLeft;  //对齐
    style.headIndent = 0.0f;//行首缩进
    style.firstLineHeadIndent = 20.0f;//首行缩进
    style.tailIndent = 0.0f;//行尾缩进
    style.lineSpacing = 5.0f;//行间距
    CGRect contentFrame = [self.intro boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 10, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0], NSParagraphStyleAttributeName:style} context:nil];
    
    _introTextView.font = [UIFont systemFontOfSize:16.0];
    
    if (contentFrame.size.height > self.view.frame.size.height - 64) {
        _introTextView.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, self.view.frame.size.height - 73);
    }else {
        _introTextView.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, contentFrame.size.height + 35);
    }
    
    [self addSubview:_introTextView];

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
