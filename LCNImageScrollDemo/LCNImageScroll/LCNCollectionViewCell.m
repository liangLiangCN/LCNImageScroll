//
//  LCNCollectionViewCell.m
//  图片轮播器
//
//  Created by 梁川楠 on 16/8/24.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import "LCNCollectionViewCell.h"
#import "UIImageView+ContextSize.h"

@implementation LCNCollectionViewCell {
    
    UIImageView *_iconView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _iconView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_iconView];
    }
    return self;
}


- (void)setImageUrl:(NSURL *)imageUrl {
    _imageUrl = imageUrl;
    
    // 根据 url 加载图片
    // 如果崩在此处, 那么请检查您传过来的是 NSURL, 还是 NSString
    NSData *data = [NSData dataWithContentsOfURL:imageUrl];
    UIImage *image = [UIImage imageWithData:data];
    
    // 自定义设置图片的方法, 防止图片生成拉伸模式, 影响性能!
    [_iconView lcn_setImage:image];
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    [_iconView lcn_setImage:image];
}

@end
