//
//  LCNCollectionViewCell.h
//  图片轮播器
//
//  Created by 梁川楠 on 16/8/24.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^newImageBlock)(UIImage *image);

@interface LCNCollectionViewCell : UICollectionViewCell

/**
 *  每张图片的url
 */
@property (nonatomic,strong) NSURL *imageUrl;


@property(nonatomic, strong) UIImage *image;

@property(nonatomic, copy) newImageBlock newImage;


@end
