//
//  CutdownViewController.h
//  ToolsDemo
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CutdownViewController;
@protocol showTimeDelegate <NSObject>

@required
-(void)sendTime:(CutdownViewController*)Cutdown time:(NSInteger)num;
@end
@interface CutdownViewController : UIViewController

@property(nonatomic,assign)id<showTimeDelegate>delegate;

@property(nonatomic,assign)NSInteger numvalues;
@end
