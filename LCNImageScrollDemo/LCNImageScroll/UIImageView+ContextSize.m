//
//  UIImageView+ContextSize.m
//  图片轮播器
//
//  Created by 梁川楠 on 16/8/24.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import "UIImageView+ContextSize.h"

@implementation UIImageView (ContextSize)

- (UIImage *)lcn_setImage:(UIImage *)image {
    
    if (CGSizeEqualToSize(image.size, self.bounds.size)) {
        [self setImage:image];
        return nil;
    }
    // 根据 imageiew 的大小, 重新调整 image 的大小
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    [image drawInRect:self.bounds];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    [self setImage:resultImage];
    
    return resultImage;
}
@end
