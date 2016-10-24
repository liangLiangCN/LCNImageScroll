//
//  ViewController.m
//  LCNImageScrollDemo
//
//  Created by 梁川楠 on 16/8/25.
//  Copyright © 2016年 liangLiang. All rights reserved.
//

#import "ViewController.h"
#import "LCNImageScroll.h"

@interface ViewController ()

@end

@implementation ViewController{
    NSArray <NSURL *> *_urls;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载数据
    [self loadData];
    
//    [self.view lcn_addImageScrollWithFrame:CGRectMake(0, 0, 375, 200) urls:_urls timeInterval:3 selectImageClick:^(NSInteger index) {
//        
//        NSLog(@"%zd", index);
//    }];
    [self.view lcn_addImageScrollWithFrame:CGRectMake(0, 0, 375, 200) urls:_urls timeInterval:2 addPageControlWithFrame:CGRectMake(10, 175, 100, 30) pageCurrentColor:[UIColor redColor] pageColor:[UIColor blueColor] selectImageClick:^(NSInteger index) {
        NSLog(@"%zd", index);
    }];
}

- (void)loadData {
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%02zd.jpg", (i + 1)];
        
        // 提示：如果 fileName 不存在 url 返回 nil
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        
        [arrayM addObject:url];
    }
    
    _urls = arrayM.copy;
}


@end
