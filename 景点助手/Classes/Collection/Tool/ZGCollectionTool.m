//
//  ZGCollectionTool.m
//  景点助手
//
//  Created by ZZG on 15/12/16.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGCollectionTool.h"

@implementation ZGCollectionTool

+ (NSMutableArray *)dataWithFileName:(NSString *)fileName {
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    //fileName就是保存文件的文件名，filePath是文件的具体路径
    NSString *documentPath =[documentPaths objectAtIndex:0];
    
    //fileName就是保存文件的文件名,filepath是文件的具体路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:fileName];
    
    //    NSLog(@"fileName:%@    filePath:%@", fileName, filePath);
    
    //从FileName中读取出数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSMutableArray *array = (NSMutableArray*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if (array == nil) {
        array = [NSMutableArray array];
    }
    
    return array;
}

+ (void)saveWithFileName:(NSString *)fileName dataArray:(NSMutableArray *)array {
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    //fileName就是保存文件的文件名，filePath是文件的具体路径
    NSString *documentPath =[documentPaths objectAtIndex:0];
    
    //fileName就是保存文件的文件名,filepath是文件的具体路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:fileName];
    
    //    NSLog(@"fileName:%@    filePath:%@", fileName, filePath);
    
    NSData *data2 = [NSKeyedArchiver archivedDataWithRootObject:array];
    
    //将NSData类型对象data写入文件，文件名为fileName
    [data2 writeToFile:filePath atomically:YES];
}

@end
