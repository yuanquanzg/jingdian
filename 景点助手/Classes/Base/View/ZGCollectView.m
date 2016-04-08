//
//  ZGCollectView.m
//  景点助手
//
//  Created by ZZG on 16/4/7.
//  Copyright © 2016年 赵志刚. All rights reserved.
//

#import "ZGCollectView.h"
#import "ZGButton.h"
#import "ZGCollectionModel.h"

@interface ZGCollectView ()

@property (strong, nonatomic) UIButton *collectionButton;

@property (strong, nonatomic) NSString *fileName;
//@property (strong, nonatomic) NSString *Id;
@property (strong, nonatomic) ZGCollectionModel *model;

@end

@implementation ZGCollectView

- (instancetype)initWithCollectionModel:(ZGCollectionModel *)model fileName:(NSString *)fileName {
    self = [super init];
    if (self) {
        self.model = model;
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
    
    self.backgroundColor = [UIColor clearColor];
//    self.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:0.8];
//    UIImage *bgImage = [UIImage imageNamed:@"bar_backgroundImage_deselect"];
    
//    _shareButton = [ZGButton buttonWithType:UIButtonTypeRoundedRect];
//    _shareButton.backgroundColor = [UIColor whiteColor];
//    [_shareButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
//    [_shareButton setImage:[[UIImage imageNamed:@"detail_share_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
//    [_shareButton setTitle:@"分享" forState:UIControlStateNormal];
//    _shareButton.translatesAutoresizingMaskIntoConstraints = NO;
//    [_shareButton addTarget:self action:@selector(clickShare:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:_shareButton];
    
    _collectionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _collectionButton.backgroundColor = [UIColor whiteColor];
    [_collectionButton setFrame: self.frame];
//    [_collectionButton setTitleColor:[UIColor colorWithPatternImage:bgImage] forState:UIControlStateNormal];
//    [_collectionButton setTitle:@"收藏" forState:UIControlStateNormal];
    _collectionButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_collectionButton addTarget:self action:@selector(clickCollection:) forControlEvents:UIControlEventTouchUpInside];
    if ([self checkScenicId]) {
        [_collectionButton setImage:[[UIImage imageNamed:@"detail_collect_select.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }else {
        [_collectionButton setImage:[[UIImage imageNamed:@"detail_collect_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }
    [self addSubview:_collectionButton];
    
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    //添加横向约束
//    NSDictionary *viewsDic = NSDictionaryOfVariableBindings(_collectionButton, _shareButton);
//    NSString *hVFL = @"H:|-0-[_collectionButton(==_shareButton)]-1-[_shareButton]-0-|";
//    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:viewsDic];
//    [self addConstraints:hCons];
//    
//    //添加纵向约束
//    NSString *vVFL1 = @"V:|-0-[_collectionButton]-0-|";
//    NSArray *vCons1 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL1 options:0 metrics:nil views:viewsDic];
//    [self addConstraints:vCons1];
//    
//    NSString *vVFL2 = @"V:|-0-[_shareButton]-0-|";
//    NSArray *vCons2 = [NSLayoutConstraint constraintsWithVisualFormat:vVFL2 options:0 metrics:nil views:viewsDic];
//    [self addConstraints:vCons2];
//}

- (void)clickCollection:(UIButton *)btn {
    if ([self checkScenicId]) {
        [_collectionButton setImage:[[UIImage imageNamed:@"detail_collect_deselect.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self removeScenic];
    }else {
        [_collectionButton setImage:[[UIImage imageNamed:@"detail_collect_select.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self saveScenic];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_collectionButton setFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
}

//- (void)clickShare:(UIButton *)btn {
//    [self.delegate clickShareButton:btn];
//}

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
    //从FileName中读取出数据
    NSData *data1 = [NSData dataWithContentsOfFile:filePath];
    NSMutableArray *array = (NSMutableArray*) [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    if (array == nil) {
        array = [NSMutableArray array];
    }
    
    //    [array addObject:[NSDictionary dictionaryWithObjects:@[_model.thingId, _model.imageUrl, _model.thingName] forKeys:@[@"thingId", @"imageUrl", @"thingName"]]];
    [array addObject:_model];
    
    NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:array];
    
    //将NSData类型对象data写入文件，文件名为fileName
    [data2 writeToFile:filePath atomically:YES];
    
}

//检查是否已经收藏
- (BOOL)checkScenicId {
    
    BOOL flag = NO;
    
    NSMutableArray *array = [self getCollectionArray];
    for (ZGCollectionModel *model in array) {
        if ([model.thingId isEqualToString:_model.thingId]) {
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
    //从FileName中读取出数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSMutableArray *array = (NSMutableArray*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
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
    //从FileName中读取出数据
    NSData *data1 = [NSData dataWithContentsOfFile:filePath];
    NSMutableArray *array = (NSMutableArray*) [NSKeyedUnarchiver unarchiveObjectWithData:data1];
    
    if (array == nil) {
        array = [NSMutableArray array];
    }
    
    //此处不应该使用快速遍历的方法，这样会造成数组在不同线程中同时操作的错误
    for (int i = 0; i < array.count; i++) {
        ZGCollectionModel *model = array[i];
        if ([model.thingId isEqualToString:_model.thingId]) {
            [array removeObject:model];
        }
    }
    
    NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:array];
    //    NSLog(@"%@", array);
    
    [data2 writeToFile:filePath atomically:YES];
}


@end
