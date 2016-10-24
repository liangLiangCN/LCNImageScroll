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


- (void)setImage:(UIImage *)image {
    _image = image;
    
    UIImage *newImage = [_iconView lcn_setImage:image];
    
    // 把处理好的图片返回给控制器, 让控制器做一个缓存
    if (self.newImage && newImage) {
        self.newImage(newImage);
    }
}

@end
