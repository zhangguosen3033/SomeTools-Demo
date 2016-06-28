//
//  person.h
//  ToolsDemo
//
//  Created by Apple on 16/6/28.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface person : NSObject

@property (nonatomic,assign)int age;    //外部调用的类

-(void)func1;
-(void)func2;

@end

