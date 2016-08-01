//
//  TestViewController.m
//  TimerTest
//
//  Created by Apple on 16/7/29.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "TestViewController.h"

#define kApplicationFrame [[UIScreen mainScreen] applicationFrame]
#define kWidthOfSnowflake 30.0

@interface TestViewController ()
- (void)layoutUI;
- (void)snow;
@end

@implementation TestViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self layoutUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)layoutUI {
    self.view.backgroundColor = [UIColor whiteColor];
    _imgSnowflake = [UIImage imageNamed:@"叶子.jpg"];
    
    //定时器；每隔0.5秒执行一次
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(snow)
                                   userInfo:nil
                                    repeats:YES];
}

-(void)snow {
    NSString *strWidthOfScene = [NSString stringWithFormat:@"%f", kApplicationFrame.size.width-kWidthOfSnowflake]; //bounds 返回整个屏幕大小；applicationFrame 返回去除状态栏后的屏幕大小
    CGFloat startX = arc4random()%[strWidthOfScene integerValue]; //产生随机数0到strWidthOfScene-1
    CGFloat endX = (arc4random()%[strWidthOfScene integerValue]) + 1; //产生随机数1到strWidthOfScene
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:_imgSnowflake];
    imgV.frame = CGRectMake(startX, -20.0, kWidthOfSnowflake, kWidthOfSnowflake);
    imgV.alpha = 0.8;
    [self.view addSubview:imgV];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:5];
    imgV.frame = CGRectMake(endX,
                            kApplicationFrame.size.height+20.0-kWidthOfSnowflake,
                            kWidthOfSnowflake,
                            kWidthOfSnowflake);
    [UIView commitAnimations];
}


@end
