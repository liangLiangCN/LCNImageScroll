//
//  LCNCollectionView.m
//  图片轮播器
//
//  Created by 梁川楠 on 16/8/24.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import "LCNCollectionView.h"
#import "LCNCollecitonFlowLayout.h"
#import "LCNCollectionViewCell.h"

#define LCNCollectionViewControllerReusableCellWithReuseIdentifier @"LCNCollectionViewControllerReusableCellWithReuseIdentifier"

@interface LCNCollectionView () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) NSMutableArray *imageArray;


@end

@implementation LCNCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout {
    
    LCNCollecitonFlowLayout *flowLayout = [[LCNCollecitonFlowLayout alloc] init];
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.dataSource = self;
        self.delegate = self;
        
        // 注册cell
        [self registerClass:[LCNCollectionViewCell class] forCellWithReuseIdentifier:LCNCollectionViewControllerReusableCellWithReuseIdentifier];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.025 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            NSIndexPath *indxPath = [NSIndexPath indexPathForItem:0 inSection:1];
            
            [self scrollToItemAtIndexPath:indxPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
            
            // 滚动到指定位置之后, 开启定时器
            [self timer];
        });
        
    }
    return self;
}


//- (void)setUrls:(NSArray<NSURL *> *)urls {
//    
//    // 让图片一出来就在第一组, 为了防止视图未加载完毕, 所以开启延时
//    if (urls.count > 0) {
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.025 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            
//            NSIndexPath *indxPath = [NSIndexPath indexPathForItem:0 inSection:1];
//            
//            [self scrollToItemAtIndexPath:indxPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//            
//            // 滚动到指定位置之后, 开启定时器
//            [self timer];
//        });
//        
//    }
//}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.urls.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LCNCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LCNCollectionViewControllerReusableCellWithReuseIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[LCNCollectionViewCell alloc] init];
    }
    
//    cell.imageUrl = self.urls[indexPath.item];
    cell.image = self.imageArray[indexPath.item];
    cell.newImage = ^(UIImage *newImage) {
        // 把做过处理的图片 做一个缓存
        if (![self.imageArray containsObject:newImage]) {
            [self.imageArray replaceObjectAtIndex:indexPath.item withObject:newImage];
        }
        NSLog(@"%@----%zd", self.imageArray, indexPath.item);
    };
    return cell;
}

#pragma mark - 代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.selectImageClickBlock) {
        self.selectImageClickBlock(indexPath.item);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat index = scrollView.contentOffset.x;
    NSInteger page = (index - self.urls.count * self.bounds.size.width) / [UIScreen mainScreen].bounds.size.width;
    if (page == self.urls.count) {
        page = 0;
    }
    if (self.pageControl != nil) {
        
        self.pageControl.currentPage = page;
    }
    
}

/**
 *  当滚动结束调用此方法
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    [self scrollViewStop];
}

/**
 *  当开始拖拽时调用此方法
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    // 销毁定时器
    [self.timer invalidate];
    self.timer = nil;
}

/**
 *  当停止拖拽时调用此方法
 *
 *  @param decelerate 是否有降速
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    [self timer];
    [self scrollViewStop];
}

- (void)scrollViewStop {
    
    // 获取当前的 indexPath 值
    NSIndexPath *indxPath = [[self indexPathsForVisibleItems] lastObject];
    
    // 让视图滚动到第 1 组, 不带动画
    if (indxPath.section != 1) {
        indxPath = [NSIndexPath indexPathForItem:indxPath.item inSection:1];
        // 滚动到指定位置
        [self scrollToItemAtIndexPath:indxPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
}

#pragma mark - 定时器的懒加载
- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        
        // 添加到当前循环, 并设为通用模式
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}
/**
 *  定时器的方法, 自动播放下一页
 */
- (void)nextPage {
    
    // 获取当前的 indexPath 值
    NSIndexPath *indxPath = [[self indexPathsForVisibleItems] lastObject];
    
    // 索引值+1
    if (indxPath.item != self.urls.count - 1) {
        indxPath = [NSIndexPath indexPathForItem:indxPath.item + 1 inSection:indxPath.section];
    } else {
        indxPath = [NSIndexPath indexPathForItem:0 inSection:2];
    }
    
    // 滚动到指定位置
    [self scrollToItemAtIndexPath:indxPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

- (NSMutableArray *)imageArray {
    
    if (!_imageArray) {
        NSMutableArray *arrayM = [NSMutableArray array];
        
        [self.urls enumerateObjectsUsingBlock:^(NSURL * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSData *data = [NSData dataWithContentsOfURL:obj];
            UIImage *image = [UIImage imageWithData:data];
            
            [arrayM addObject:image];
        }];
        
        _imageArray = arrayM;
    }
    
    return _imageArray;
}



@end
