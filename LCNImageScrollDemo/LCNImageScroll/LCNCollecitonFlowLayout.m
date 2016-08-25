//
//  LCNCollecitonFlowLayout.m
//  图片轮播器
//
//  Created by 梁川楠 on 16/8/24.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import "LCNCollecitonFlowLayout.h"

@implementation LCNCollecitonFlowLayout

#pragma mark - 当此方法调用的时候, collectionView 已经有frame值
- (void)prepareLayout {
    [super prepareLayout];
    
    CGRect viewFrame = self.collectionView.bounds;
    
    self.itemSize = CGSizeMake(viewFrame.size.width, viewFrame.size.height);
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
}
@end
