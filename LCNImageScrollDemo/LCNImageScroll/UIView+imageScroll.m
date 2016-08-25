//
//  UIView+imageScroll.m
//  图片轮播器
//
//  Created by 梁川楠 on 16/8/24.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import "UIView+imageScroll.h"
#import "LCNCollectionView.h"
#import <objc/runtime.h>

@implementation UIView (imageScroll)

- (void)lcn_addImageScrollWithFrame:(CGRect)frame urls:(NSArray<NSURL *> *)urls timeInterval:(NSTimeInterval)timeInterval selectImageClick:(void (^)(NSInteger))selectImaegClickBlock {
    
    UICollectionViewLayout *flowLayout = [[UICollectionViewLayout alloc] init];

    LCNCollectionView *collectionView = [[LCNCollectionView alloc] initWithFrame:frame collectionViewLayout: flowLayout];
    
    collectionView.urls = urls;
    collectionView.timeInterval = timeInterval;
    collectionView.selectImageClickBlock = selectImaegClickBlock;
    
    [self addSubview:collectionView];
    
}

@end
