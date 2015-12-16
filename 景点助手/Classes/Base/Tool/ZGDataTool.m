//
//  ZGDataTool.m
//  景点助手
//
//  Created by ZZG on 15/12/13.
//  Copyright © 2015年 赵志刚. All rights reserved.
//

#import "ZGDataTool.h"

@implementation ZGDataTool

//保存数据
+ (void)saveDataWithPath:(NSString *)path params:(NSDictionary *)dict withData:(id)JSON {
    
    NSMutableString *fileName = [NSMutableString stringWithString:path];
    for (NSString *str in dict.allKeys) {
        [fileName appendString:dict[str]];
    }
    
    //使用C函数NSSearchPathForDirectoriesInDomains来获得沙盒中目录的全路径。该函数有三个参数，目录类型、he domain mask、布尔值。其中布尔值表示是否需要通过～扩展路径。而且第一个参数是不变的，即为NSSearchPathDirectory 。在IOS中后两个参数也是不变的，即为：NSUserDomainMask 和 YES。
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
    
    //fileName就是保存文件的文件名，filePath是文件的具体路径
    NSString *documentPath =[documentPaths objectAtIndex:0];
    
    //fileName就是保存文件的文件名,filepath是文件的具体路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:fileName];
    
//    NSLog(@"fileName:%@    filePath:%@", fileName, filePath);
    
    //因为JSON中可能存在null值，所以保存总会失败，解决这个问题就只需要将NSDictionary->NSData再writeToFile就好了，读取的时候先读取NSData再NSData->NSDictionary
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:JSON];

    //将NSData类型对象data写入文件，文件名为fileName
    [data writeToFile:filePath atomically:YES];
}


//取出数据
+ (id)dataWithWithPath:(NSString *)path params:(NSDictionary *)dict {
    
    NSMutableString *fileName = [NSMutableString stringWithString:path];
    for (NSString *str in dict.allKeys) {
        [fileName appendString:dict[str]];
    }
    
    //使用C函数NSSearchPathForDirectoriesInDomains来获得沙盒中目录的全路径。该函数有三个参数，目录类型、he domain mask、布尔值。其中布尔值表示是否需要通过～扩展路径。而且第一个参数是不变的，即为NSSearchPathDirectory 。在IOS中后两个参数也是不变的，即为：NSUserDomainMask 和 YES。
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    
    //取出第一个文件夹的路径，即Documents
    NSString *documentPath =[documentPaths objectAtIndex:0];
    
    //fileName就是保存文件的文件名，filePath是文件的具体路径
    NSString *filePath=[documentPath stringByAppendingPathComponent:fileName];
    
   NSLog(@"fileName:%@    filePath:%@", fileName, filePath);
    
    //从FileName中读取出数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *dictionary = (NSDictionary*) [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    return dictionary;
}

@end
