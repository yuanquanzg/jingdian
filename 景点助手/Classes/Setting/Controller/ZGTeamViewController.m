//
//  ZGTeamViewController.m
//  景点助手
//
//  Created by ZZG on 16/4/21.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGTeamViewController.h"
#import "ZGHotelIntroTextView.h"

@interface ZGTeamViewController ()

@property (strong, nonatomic) ZGHotelIntroTextView *introTextView;
@property (strong, nonatomic) UIButton *feedbackBtn;

@end

@implementation ZGTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self buildView];
}

- (void)buildView {
    
    self.title = @"开发声明";
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"placeholderImage.png"]]];
    
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
    
    NSString *text = @"出去旅游已经成为大家的生活必备，但是却常常为景点的选择而苦恼，难以快速了解到关于景点的各项信息。本软件为用户提供一个以景点推荐为出发点的信息查询客户端。应用以用户选择的地点为基础，为用户推荐该地的优秀景点，并为用户提供景点的天气，交通，简介及其它各项与景点相关信息的查询。避免了用户频繁的切换于各个App之间进行查询，随时随地掌握景点信息。界面清爽，运行流畅，注重为用户带来优良的掌上体验。\n如有意见，欢迎反馈，本人定虚心接受，及时改正，感谢老师指导。";
    
    _introTextView.text = text;
    
    _introTextView.editable = NO;
    
    _introTextView.scrollEnabled = NO;
    
    //景点性情位置
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    //    style.alignment = NSTextAlignmentLeft;  //对齐
    style.headIndent = 0.0f;//行首缩进
    style.firstLineHeadIndent = 20.0f;//首行缩进
    style.tailIndent = 0.0f;//行尾缩进
    style.lineSpacing = 5.0f;//行间距
    CGRect contentFrame = [text boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 10, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16.0], NSParagraphStyleAttributeName:style} context:nil];
    
    _introTextView.font = [UIFont systemFontOfSize:16.0];
    
    if (contentFrame.size.height > self.view.frame.size.height - 64) {
        _introTextView.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, self.view.frame.size.height - 73);
    }else {
        _introTextView.frame = CGRectMake(5, 5, self.view.frame.size.width - 10, contentFrame.size.height + 35);
    }
    
    [self addSubview:_introTextView];
    
    _feedbackBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_feedbackBtn setCenter:CGPointMake(self.view.center.x, self.view.frame.size.height - 150)];
    [_feedbackBtn setBounds:CGRectMake(0, 0, 40, 20)];
    [_feedbackBtn setTitle:@"反馈" forState:UIControlStateNormal];
    [_feedbackBtn.titleLabel setFont:[UIFont systemFontOfSize:15.0]];
    [_feedbackBtn setTitleColor:[UIColor colorWithRed:0 green:128 / 256.0 blue:255 / 256.0 alpha:1] forState:UIControlStateNormal ];
    [_feedbackBtn addTarget: self action:@selector(feedBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_feedbackBtn];
    

}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)feedBack {
    
    [[UIApplication sharedApplication]openURL:[NSURL   URLWithString:@"mailto://yuanquanzg@foxmail.com"]];
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
