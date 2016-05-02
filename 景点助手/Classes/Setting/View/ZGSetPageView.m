//
//  ZGSetPageView.m
//  景点助手
//
//  Created by ZZG on 16/5/1.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGSetPageView.h"
#import "ZGSetImageView.h"

@interface ZGSetPageView ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;

@property (nonatomic, copy) void (^quitAboutView)(SEL selector);

@end

@implementation ZGSetPageView

- (instancetype)initWithFrame:(CGRect)frame {
 
    self = [super initWithFrame:frame];
    if (self) {
        [self buildView];
    }
    
    return self;
    
}

- (void)buildView {
    
    _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    [_scrollView setDelegate:self];
    [_scrollView setBounces:NO];
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [_scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.bounds) * 3.0, CGRectGetHeight(self.bounds))];
    [_scrollView setPagingEnabled:YES];
    
    ZGSetImageView *page1 = [[ZGSetImageView alloc]initWithCentreImage:[UIImage imageNamed:@"setting_scenic.png"] title:@"景点查询"];
    [page1 setFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
    [_scrollView addSubview:page1];
    
    ZGSetImageView *page2 = [[ZGSetImageView alloc]initWithCentreImage:[UIImage imageNamed:@"setting_hotel.png"] title:@"酒店查询"];
    [page2 setFrame:CGRectMake(CGRectGetWidth(self.bounds), 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
    [_scrollView addSubview:page2];
    
    ZGSetImageView *page3 = [[ZGSetImageView alloc]initWithCentreImage:[UIImage imageNamed:@"setting_collect.png"] title:@"收藏查询"];
    [page3 setFrame:CGRectMake(CGRectGetWidth(self.bounds) * 2, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
    [_scrollView addSubview:page3];

    
    [self addSubview:_scrollView];
    
    _pageControl = [[UIPageControl alloc]init];
    [_pageControl setCenter:CGPointMake(self.center.x, self.frame.size.height - 10)];
    [_pageControl setNumberOfPages:3];
    [_pageControl setCurrentPage:0];
    [_pageControl setPageIndicatorTintColor:[UIColor grayColor]];
    [_pageControl setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
    [self addSubview:_pageControl];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger num = scrollView.contentOffset.x / self.frame.size.width;
    [_pageControl setCurrentPage:num];
}

@end
