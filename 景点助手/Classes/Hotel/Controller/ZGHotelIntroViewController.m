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
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _introTextView = [[ZGHotelIntroTextView alloc]init];
    _introTextView.text = _intro;
    //景点性情位置
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    //    style.alignment = NSTextAlignmentLeft;  //对齐
    style.headIndent = 0.0f;//行首缩进
    style.firstLineHeadIndent = 20.0f;//首行缩进
    style.tailIndent = 0.0f;//行尾缩进
    style.lineSpacing = 5.0f;//行间距
    CGRect contentFrame = [self.intro boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 6, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17.0], NSParagraphStyleAttributeName:style} context:nil];
    
    _introTextView.font = [UIFont systemFontOfSize:16.0];
    
    if (contentFrame.size.height > self.view.frame.size.height) {
        _introTextView.frame = CGRectMake(3, 0, self.view.frame.size.width - 6, self.view.frame.size.height);
    }else {
        _introTextView.frame = CGRectMake(3, 0, self.view.frame.size.width - 6, contentFrame.size.height);
    }
    
    [self addSubview:_introTextView];

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
