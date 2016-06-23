//
//  UIButton+GSbutton.m
//  ToolsDemo
//
//  Created by Apple on 16/6/23.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "UIButton+GSbutton.h"

@implementation UIButton (GSbutton)

-(void)GS_SetMyButtonWithName:(NSString *)name{

    [self setTitle:name forState:UIControlStateNormal];
    
    [self setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    self.backgroundColor = [UIColor blueColor];
    
}

@end
