//
//  UIImageView+ZYWebCache.h
//  ZYWebImage
//
//  Created by MengLong Wu on 16/9/14.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ZYWebCache)

- (void)zy_setImageWithURL:(NSURL *)url;

- (void)zy_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;



@end
