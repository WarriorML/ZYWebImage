//
//  ImageManager.m
//  ZYWebImage
//
//  Created by MengLong Wu on 16/9/14.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "ImageManager.h"
#import "Base64.h"
#import "ImageOperation.h"
static ImageManager *__manager = nil;

@implementation ImageManager

#pragma mark -单例方法
//单例方法
+ (ImageManager *)sharedManager
{
    if (!__manager) {
        __manager = [[ImageManager alloc]init];
    }
    return __manager;
}

+ (id)alloc
{
    @synchronized (self) {
        if (!__manager) {
            __manager = [super alloc];
        }
        return __manager;
    }
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    @synchronized (self) {
        if (!__manager) {
            __manager = [super allocWithZone:zone];
        }
        return __manager;
    }
}

- (id)init
{
    @synchronized (self) {
        self = [super init];
        if (self) {
            _imageCaches = [[NSMutableDictionary alloc]init];
            _queue = [[NSOperationQueue alloc]init];
//            最大并发数
            _queue.maxConcurrentOperationCount = 3;
        }
        return self;
    }
}

#pragma mark - 获取文件夹路径
- (NSString *)getDirectoryPath
{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Document/caches"];
    
    BOOL isDir;
//    如果文件夹不存在或者不是一个文件夹，就创建这个文件夹
    if (![[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir] || isDir == NO) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    return path;
}

#pragma mark - 获取文件路径
- (NSString *)getFilePathWithFileName:(NSString *)fileName
{
    return [[self getDirectoryPath] stringByAppendingPathComponent:fileName];
}

#pragma mark - 下载图片
- (void)downloadImageWithURL:(NSURL *)url forImageView:(UIImageView *)imageView
{
    if (!url) {
        return;
    }
    
//    获取url经过base64编码的key
    NSString *key = [url.absoluteString base64EncodedString];
//    先从内存中查找
    UIImage *image = [_imageCaches objectForKey:key];
    
    if (image) {
        imageView.image = image;
        return;
    }
    
//    从沙盒中找
    NSString *path = [self getFilePathWithFileName:key];
    NSData *imageData = [[NSData alloc]initWithContentsOfFile:path];
    if (imageData) {
//        如果沙盒中存在，设置图片
        UIImage *image1 = [[UIImage alloc]initWithData:imageData];
        imageView.image = image1;
//        并把图片存入内存
        [_imageCaches setObject:image1 forKey:key];
        
        return;
    }
    
//    下载
    ImageOperation *operation = [[ImageOperation alloc]initWithURL:url imageView:imageView];
    
    [_queue addOperation:operation];
}
















@end
