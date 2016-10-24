图片无线轮播, 很多人都会写, 原理就不多说了, 这个是我自己写的第一个第三方, 可以一句话添加图片轮播器, 它的优势有两个, 一个是简单, 调用一个方法搞定, 第二个是它对图片的拉伸模式做了处理

集成方法: 
1.1自动集成:
在 podfile 文件中

pod 'LCNImageScroll'

在终端执行 pod update 命令
1.2手动集成:
https://github.com/liangLiangCN/LCNImageScroll
从 github 下载 demo, 然后把 LCNImageScroll 文件夹拖入到项目中即可

2.导入头文件 LCNImageScroll.h

3.调用方法(有两个, 分别为带分页指示器和不带分页指示器)即完成轮播器的创建

3.1该方法可以自定义轮播器的大小, 播放时间, 当点击图片时, 能根据图片的索引值来做一些事情
	
	- (void)lcn_addImageScrollWithFrame:(CGRect)frame urls:(NSArray <NSURL *> *)urls timeInterval:(NSTimeInterval)timeInterval selectImageClick:(void (^)(NSInteger index))selectImaegClickBlock;

3.2 当需要增加分页指示器时, 调用此方法 此方法除了上面方法的功能外, 还增加了分页指示器, 可以自定义分页指示器的 frame, 选中颜色, 和未选中颜色
	
	- (void)lcn_addImageScrollWithFrame:(CGRect)frame urls:(NSArray<NSURL *> *)urls timeInterval:(NSTimeInterval)timeInterval addPageControlWithFrame:(CGRect)pageControlFrame pageCurrentColor:(UIColor *)currentColor pageColor:(UIColor *)pageColor selectImageClick:(void (^)(NSInteger))selectImaegClickBlock;
