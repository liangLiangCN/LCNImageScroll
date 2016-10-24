//
//  UIView+imageScroll.h
//  图片轮播器
//
//  Created by 梁川楠 on 16/8/24.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (imageScroll)

/**
 *  添加图片轮播器(不带分页指示器)
 *
 *  @param frame        frame
 *  @param urls         需要轮播的图片数组(url)
 *  @param timeInterval 播放时间
 *  @param selectImaegClickBlock 图片的点击事件
 */
- (void)lcn_addImageScrollWithFrame:(CGRect)frame urls:(NSArray <NSURL *> *)urls timeInterval:(NSTimeInterval)timeInterval selectImageClick:(void (^)(NSInteger index))selectImaegClickBlock;

/**
 *  添加图片轮播器(带分页指示器)
 *
 *  @param frame                frame
 *  @param urls                 需要轮播的图片数组(url)
 *  @param timeInterval         播放时间
 *  @param pageControlFrame     分页指示器的frame
 *  @param currentColor         分页指示器选中页的颜色
 *  @param pageColor            分页指示器未选中页的颜色
 *  @param selectImaegClickBlock 图片的点击事件
 */
- (void)lcn_addImageScrollWithFrame:(CGRect)frame urls:(NSArray<NSURL *> *)urls timeInterval:(NSTimeInterval)timeInterval addPageControlWithFrame:(CGRect)pageControlFrame pageCurrentColor:(UIColor *)currentColor pageColor:(UIColor *)pageColor selectImageClick:(void (^)(NSInteger index))selectImaegClickBlock;
@end
