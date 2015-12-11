//
//  ZGPageView.m
//  景点助手
//
//  Created by ZZG on 15/12/9.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGPageView.h"
#import "ZGScenicDetail.h"
#import "UIImageView+ZGTool.h"


@interface ZGPageView ()

@property (strong, nonatomic) UIScrollView *scrollView; //图片放置于ScrollView之上
@property (strong, nonatomic) NSMutableArray *imageArray;   //存储图片路径的数组
@property (strong, nonatomic) UIPageControl *pageControl;   //用于图片节点指示
@property (strong, nonatomic) NSTimer *timer;   //定时器
@property (nonatomic,assign) BOOL isDragging;   //是否正在拖动

@property (strong, nonatomic) UIImageView *lastImageView;   //上一张ImageView
@property (strong, nonatomic) UIImageView *currentImageView;    //当前展示的ImageView
@property (strong, nonatomic) UIImageView *nextImageView;   //下一张ImageView
@end

@implementation ZGPageView

- (instancetype)initWithFrame:(CGRect)frame  array:(NSArray *)detailArray{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initData:detailArray];
        [self buildView];
    }
    return self;
}

- (void)initData:(NSArray *)detailArray {
    //取出imageUrl
    _imageArray = [NSMutableArray array];
    for (ZGScenicDetail *detail in detailArray) {
//        UIImageView *imageView = [[UIImageView alloc]init];
//        [imageView loadImageWithUrl:detail.imageUrl];
//        [_imageArray addObject:imageView ];
        [_imageArray addObject:detail.imageUrl];
    }
    
    // 设置时钟动画 定时器
//    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(update:) userInfo:nil repeats:YES];
    // 将定时器添加到主线程
//    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

   // 默认不拖动
    _isDragging = NO;
}


- (void)buildView {
    CGFloat WIDTH = self.frame.size.width;
    CGFloat HEIGHT = self.frame.size.height;
    
    _pageControl = [[UIPageControl alloc]init];
    //设置pageControl分页个数
    _pageControl.numberOfPages = _imageArray.count;
    _pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:_pageControl];

    
    _scrollView = [[UIScrollView alloc]init];
    //  设置自动分页
//    _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    _scrollView.pagingEnabled = YES;
    // 设置隐藏横向条
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 设置是否有边界
    _scrollView.bounces = NO;
    // 添加图片
//    //添加上一张图片
//    _lastImageView = _imageArray[_imageArray.count - 1];
//    //添加当前图片
//    _currentImageView = _imageArray[0];
//    //添加下一张图片
//    _nextImageView = _imageArray[1];
    
    for (int i = 0; i < _imageArray.count; i++) {
        if (i == 0) {
            UIImageView *imgViewLast = [[UIImageView alloc]initWithFrame:CGRectMake((_imageArray.count + 1) *WIDTH, 0, WIDTH, HEIGHT)];
            [imgViewLast loadImageWithUrl:_imageArray[0]];
            [_scrollView addSubview:imgViewLast];

        }else if (i == _imageArray.count -1) {
            UIImageView *imgViewFirst = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
            [imgViewFirst loadImageWithUrl:_imageArray[_imageArray.count - 1]];
            [_scrollView addSubview:imgViewFirst];
        }
        
        NSString *url = _imageArray[i];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((i + 1) * WIDTH, 0, WIDTH, HEIGHT)];
        [imageView loadImageWithUrl:url];
        //        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [_scrollView addSubview:imageView];
    }
    
    [self addSubview:_scrollView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat WIDTH = self.frame.size.width;
    CGFloat HEIGHT = self.frame.size.height;
    
    _scrollView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    //  设置当前点
    _scrollView.contentOffset = CGPointMake(WIDTH, 0);

//    //设置滚动范围
    _scrollView.contentSize = CGSizeMake(WIDTH * (_imageArray.count + 2), 0);
    
//    _lastImageView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
//    
//    _currentImageView.frame = CGRectMake(WIDTH, 0, WIDTH, HEIGHT);
//    
//    _nextImageView.frame = CGRectMake(WIDTH * 2, 0, WIDTH, HEIGHT);

//    //为pangeControl添加约束
//    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_pageControl);
//    //纵向约束距离底边10，高度10
//    NSString *vVFL = @"V:[_pageControl(10)]-10-|";
//    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:viewsDictionary];
//    [_scrollView addConstraints:vCons];
//    //横向约束，距离左右各100
//    NSString *hVFL = @"H:|-100-[_pageControl(10)]-100-|";
//    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:viewsDictionary];
//    [_scrollView addConstraints:hCons];

}

- (void)update:(NSTimer *)timer{
    //定时移动
    
    if (_isDragging == YES) {
        return ;
    }
    CGFloat WIDTH = self.frame.size.width;

    CGPoint offSet = self.scrollView.contentOffset;

    if (offSet.x  == (_imageArray.count + 1)  * WIDTH) {
        offSet.x = 1 * WIDTH;
        [self.scrollView setContentOffset:offSet animated:YES];
    }else if (offSet.x == 0) {
        offSet.x = _imageArray.count * WIDTH;
        [self.scrollView setContentOffset:offSet animated:YES];
    }else {
        offSet.x += WIDTH;
        [self.scrollView setContentOffset:offSet animated:YES];
    }
 
//    CGPoint offset = self.scrollView.contentOffset;
//    offset.x += WIDTH;
    
//    if (offSet.x >= self.view.frame.size.width *2) {
//        offSet.x = self.view.frame.size.width;
//    }
    
    
}

//- (void)willMoveToSuperview:(UIView *)newSuperview {
//    [super willMoveToSuperview:newSuperview];
//    [_timer invalidate];
//}
@end
