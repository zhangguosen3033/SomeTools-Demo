//
//  AppDelegate+GSCategory.m
//  ToolsDemo
//
//  Created by Apple on 16/6/23.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "AppDelegate+GSCategory.h"

#import "LogViewController.h"
#import "BaseViewController.h"
@implementation AppDelegate (GSCategory)

-(void)GS_SetRootController{
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    LogViewController *Log= [[LogViewController alloc]init];
    
    self.window.rootViewController = Log;
  
}

//通过此处创建一个bool 来判断 是哪个为根视图
- (void)isGSTabVC:(BOOL)is{
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];

    if (is) {
      
        BaseViewController *base = [[BaseViewController alloc]init];
        
        self.window.rootViewController = base;

        
    }else{
        
        LogViewController *Log= [[LogViewController alloc]init];
        
        self.window.rootViewController = Log;

    }
    
}
@end
