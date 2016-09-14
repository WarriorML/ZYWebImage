//
//  ImageManager.h
//  ZYWebImage
//
//  Created by MengLong Wu on 16/9/14.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ImageManager : NSObject

//内存字典，用于存放图片
@property (nonatomic,strong)NSMutableDictionary *imageCaches;
//下载图片的队列
@property (nonatomic,strong)NSOperationQueue *queue;

//单例类单例方法
+ (ImageManager *)sharedManager;

//下载图片的方法
- (void)downloadImageWithURL:(NSURL *)url forImageView:(UIImageView *)imageView;

//获取文件夹路径
- (NSString *)getDirectoryPath;

//获取文件路径
- (NSString *)getFilePathWithFileName:(NSString *)fileName;

@end
