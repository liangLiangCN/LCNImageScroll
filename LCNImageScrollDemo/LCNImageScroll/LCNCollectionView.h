//
//  LCNCollectionView.h
//  图片轮播器
//
//  Created by 梁川楠 on 16/8/24.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectImageClick)(NSInteger index);

@interface LCNCollectionView : UICollectionView

@property (nonatomic,copy) selectImageClick selectImageClickBlock;

/**
 *  图片数组(url)
 */
@property (nonatomic,strong) NSArray <NSURL *> *urls;

/**
 *  播放时间
 */
@property (nonatomic,assign) NSTimeInterval timeInterval;

@end
