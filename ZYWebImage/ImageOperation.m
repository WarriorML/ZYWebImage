//
//  ImageOperation.m
//  ZYWebImage
//
//  Created by MengLong Wu on 16/9/14.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "ImageOperation.h"
#import "ImageManager.h"
#import "Base64.h"
@implementation ImageOperation

- (id)initWithURL:(NSURL *)url imageView:(UIImageView *)imageView
{
    self = [super init];
    if (self) {
        _imageView = imageView;
        _url = url;
    }
    return self;
}

- (void)main
{
//    下载操作
    NSData *data = [[NSData alloc]initWithContentsOfURL:_url];
    
    UIImage *image = [[UIImage alloc]initWithData:data];
    
//    下载完成，把图片存入内存，data存入沙盒，设置图片显示
//    存入内存
    NSString *key = [_url.absoluteString base64EncodedString];
    [[[ImageManager sharedManager] imageCaches] setObject:image forKey:key];
//    存入沙盒
    [data writeToFile:[[ImageManager sharedManager] getFilePathWithFileName:key] atomically:YES];
//    显示图片需要回到主线程刷新
    dispatch_async(dispatch_get_main_queue(), ^{
        _imageView.image = image;
    });
    
}








@end
