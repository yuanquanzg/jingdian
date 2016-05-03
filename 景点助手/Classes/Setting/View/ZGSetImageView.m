//
//  ZGSetImageView.m
//  景点助手
//
//  Created by ZZG on 16/5/2.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGSetImageView.h"

@interface ZGSetImageView ()

@property (strong, nonatomic) UIImageView *centrelImage;
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation ZGSetImageView

- (instancetype)initWithCentreImage:(UIImage *)image title:(NSString *)title {
    
    self = [super init];
    if (self) {
        [self setImage:[UIImage imageNamed:@"setting_about.png"]];
        _centrelImage = [[UIImageView alloc]init];
        [_centrelImage setImage:image];
        
        _titleLabel = [[UILabel alloc]init];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setText:title];
        [self addSubview:_titleLabel];
        
        [self buildView];
    }
    
    return self;
}


- (void)buildView {
    
    [self addSubview:_centrelImage];
    
}

- (void)layoutSubviews  {
    [super layoutSubviews];
    
    [_centrelImage setFrame:CGRectMake(self.frame.size.width / 2.0 - 200 / 375.f * CGRectGetWidth(self.bounds) / 2.f, self.frame.size.height / 2.0 - 70, 200 / 375.f * CGRectGetWidth(self.bounds), 350 / 667.f * CGRectGetHeight(self.bounds))];
    
    [_titleLabel setFrame:CGRectMake(0, 30, CGRectGetWidth(self.bounds), 44)];
}

@end
