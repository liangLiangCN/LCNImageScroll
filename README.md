# LCNImageScroll
一行代码添加图片轮播器

项目中对图片的拉伸模式做了处理, 性能会好一些

直接用要添加轮播器的 view 调用该方法即可, 不需要再另外 addSubview

集成方法:
在 podfile 文件中

  pod 'LCNImageScroll'
  
在终端执行 pod update 命令

1.导入头文件 LCNImageScroll.h
  
2.调用 lcn_addImageScrollWithFrame:urls:timeInterval:selectImageClick: 方法

    [self.view lcn_addImageScrollWithFrame:CGRectMake(0, 0, 375, 200) urls:_urls timeInterval:3 selectImageClick:^(NSInteger index) {
        
        NSLog(@"%zd", index);
    }];
  
即完成轮播器的创建

该方法可以自定义轮播器的大小, 播放时间, 当点击图片时, 能根据图片的索引值来做一些事情

    - (void)lcn_addImageScrollWithFrame:(CGRect)frame urls:(NSArray <NSURL *> *)urls timeInterval:(NSTimeInterval)timeInterval selectImageClick:(void (^)(NSInteger index))selectImaegClickBlock;
  
当需要增加分页指示器时, 调用此方法
此方法除了上面方法的功能外, 还增加了分页指示器, 可以自定义分页指示器的 frame, 选中颜色, 和未选中颜色
  
    - (void)lcn_addImageScrollWithFrame:(CGRect)frame urls:(NSArray<NSURL *> *)urls timeInterval:(NSTimeInterval)timeInterval addPageControlWithFrame:(CGRect)pageControlFrame pageCurrentColor:(UIColor *)currentColor pageColor:(UIColor *)pageColor selectImageClick:(void (^)(NSInteger))selectImaegClickBlock;
