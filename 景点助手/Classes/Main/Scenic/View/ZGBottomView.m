//
//  ZGBottomView.m
//  景点助手
//
//  Created by ZZG on 15/12/11.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGBottomView.h"
#import "ZGHeaderButton.h"

@interface ZGBottomView ()

@property (strong, nonatomic) ZGHeaderButton *shareButton;
@property (strong, nonatomic) ZGHeaderButton *collectionButton;

@property (strong, nonatomic) NSString *fileName;
@property (strong, nonatomic) NSString *Id;

@end


@implementation ZGBottomView

- (instancetype)initWithId:(NSString *)Id fileName:(NSString *)fileName{
    self = [super init];
    if (self) {
        self.Id = Id;
        self.fileName = fileName;
        [self buildView];
    }
    return self;
}

- (void)buildView {
    
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, -1);
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowRadius = 0.2;
    self.clipsToBounds = NO;
    
    self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:0.8];
    UIImage *bgImage = [UIImage imageNamed:@"bar_backgroundImage_deselect"];
    
    _shareButton = [ZGHeaderButton buttonWithType:UIButtonTypeRoundedRect];
    _shareButton.backgroundColor = [UIColor whiteColor];
    [_shareButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
    [_shareButton setImage:[[UIImage imageNamed:@"detail_share_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_shareButton setTitle:@"分享" forState:UIControlStateNormal];
    _shareButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_shareButton addTarget:self action:@selector(clickShare:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_shareButton];
    
    _collectionButton = [ZGHeaderButton buttonWithType:UIButtonTypeRoundedRect];
    _collectionButton.backgroundColor = [UIColor whiteColor];
    [_collectionButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
    [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
    _collectionButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_collectionButton addTarget:self action:@selector(clickCollection:) forControlEvents:UIControlEventTouchUpInside];
    if ([self checkScenicId]) {
        [_collectionButton setImage:[[UIImage imageNamed:@"detail_collect_select.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }else {
        [_collectionButton setImage:[[UIImage imageNamed:@"detail_collect_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    [self addSubview:_collectionButton];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //添加横向约束
    NSDictionary *viewsDic = NSDictionaryOfVariableBindings(_collectionButton, _shareButton);
    NSString *hVFL = @"H:|-0-[_collectionButton(==_shareButton)]-1-[_shareButton]-0-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:viewsDic];
    [self addConstraints:hCons];
    
    //添加纵向约束
    NSString *vVFL1 = @"V:|-0-[_collectionButton]-0-|";
    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:nil views:viewsDic];
    [self addConstraints:vCons1];
    
    NSString *vVFL2 = @"V:|-0-[_shareButton]-0-|";
    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:nil views:viewsDic];
    [self addConstraints:vCons2];
}

- (void)clickCollection:(UIButton *)btn {
    if ([self checkScenicId]) {
           [_collectionButton setImage:[[UIImage imageNamed:@"detail_collect_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self removeScenic];
    }else {
        [_collectionButton setImage:[[UIImage imageNamed:@"detail_collect_select.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self saveScenic];
    }
}

- (void)clickShare:(UIButton *)btn {
    [self.delegate clickShareButton:btn];
}

//把收藏的景点存入文件
- (void)saveScenic {
    
//    NSString *fileName = @"cllectionScenic";
    NSString *fileName = _fileName;
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    //fileName就是保存文件的文件名，filePath是文件的具体路径
    NSString *documentPath =[documentPaths objectAtIndex:0];
    
    //fileName就是保存文件的文件名,filepath是文件的具体路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:fileName];
    
    //    NSLog(@"fileName:%@    filePath:%@", fileName, filePath);
    
    //检查如果文件是空的，那么初始化数组，添加ID，存入file
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:filePath];
    if (array == nil) {
        array = [NSMutableArray array];
    }
    
    [array addObject:self.Id];
    
    [array writeToFile:filePath atomically:YES];

}

//检查是否已经收藏
- (BOOL)checkScenicId {
    
    BOOL flag = NO;
    
    NSMutableArray *array = [self getCollectionArray];
    for (NSString *str in array) {
        if ([str isEqualToString:self.Id]) {
            flag = YES;
        }
    }
    return flag;
}


- (NSMutableArray *)getCollectionArray {
    NSString *fileName = _fileName;
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    //fileName就是保存文件的文件名，filePath是文件的具体路径
    NSString *documentPath =[documentPaths objectAtIndex:0];
    
    //fileName就是保存文件的文件名,filepath是文件的具体路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:fileName];
    
    //    NSLog(@"fileName:%@    filePath:%@", fileName, filePath);
    
    //检查如果文件是空的，那么初始化数组，添加ID，存入file
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:filePath];
    if (array == nil) {
        array = [NSMutableArray array];
    }

    return array;
}

//移除存储的景点
- (void)removeScenic {
    NSString *fileName = _fileName;
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    //fileName就是保存文件的文件名，filePath是文件的具体路径
    NSString *documentPath =[documentPaths objectAtIndex:0];
    
    //fileName就是保存文件的文件名,filepath是文件的具体路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:fileName];
    
//    NSLog(@"fileName:%@    filePath:%@", fileName, filePath);
    
    //检查如果文件是空的，那么初始化数组，添加ID，存入file
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:filePath];
    if (array == nil) {
        array = [NSMutableArray array];
    }
    
    //此处不应该使用快速遍历的方法，这样会造成数组在不同线程中同时操作的错误
    for (int i = 0; i < array.count; i++) {
        NSString *str = array[i];
        if ([str isEqualToString:self.Id]) {
            [array removeObject:str];
        }
    }
    
    [array writeToFile:filePath atomically:YES];
}

@end
