//
//  UIImageView+ZYWebCache.m
//  ZYWebImage
//
//  Created by MengLong Wu on 16/9/14.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "UIImageView+ZYWebCache.h"
#import "ImageManager.h"
@implementation UIImageView (ZYWebCache)

- (void)zy_setImageWithURL:(NSURL *)url
{
    [[ImageManager sharedManager] downloadImageWithURL:url forImageView:self];
}
- (void)zy_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    self.image = placeholder;
    [[ImageManager sharedManager] downloadImageWithURL:url forImageView:self];
}



@end
