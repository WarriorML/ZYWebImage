//
//  ImageOperation.h
//  ZYWebImage
//
//  Created by MengLong Wu on 16/9/14.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ImageOperation : NSOperation

@property (nonatomic,strong)NSURL *url;

@property (nonatomic,strong)UIImageView *imageView;

- (id)initWithURL:(NSURL *)url imageView:(UIImageView *)imageView;


@end
