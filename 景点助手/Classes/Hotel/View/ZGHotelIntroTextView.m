//
//  ZGHotelIntroTextView.m
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGHotelIntroTextView.h"

@implementation ZGHotelIntroTextView

- (void)setText:(NSString *)text {
    
    [super setText:text];
    
    if (text.length == 0) {
        text = @"";
    }
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    //    style.alignment = NSTextAlignmentLeft;  //对齐
    style.headIndent = 0.0f;//行首缩进
    style.firstLineHeadIndent = 20.0f;//首行缩进
    style.tailIndent = 0.0f;//行尾缩进
    style.lineSpacing = 5.0f;//行间距
    //      NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:_contentLabel.text attributes:@{ NSParagraphStyleAttributeName : style}];
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    self.attributedText = attrString;
}

@end
