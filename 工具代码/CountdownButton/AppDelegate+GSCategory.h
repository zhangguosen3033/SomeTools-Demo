//
//  AppDelegate+GSCategory.h
//  ToolsDemo
//
//  Created by Apple on 16/6/23.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (GSCategory)
/*!
 * 判断根视图是哪个 *
 *
 */
- (void)isGSTabVC:(BOOL)is;


/*!
 * 创建根视图(方法练习)
 *
 *
 */
-(void)GS_SetRootController;

@end
