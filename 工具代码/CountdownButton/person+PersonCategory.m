//
//  person+PersonCategory.m
//  ToolsDemo
//
//  Created by Apple on 16/6/28.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "person+PersonCategory.h"
#import <objc/runtime.h>

const char * str = "myKey";  //做为key，字符常量 必须是C语言字符串；

@implementation person (PersonCategory)
-(void)setHeight:(float)height
{
    NSNumber *num = [NSNumber numberWithFloat:height];
    /*
     第一个参数是需要添加属性的对象；
     第二个参数是属性的key；
     第三个参数是属性的值；
     第四个参数是使用的策略，是一个枚举值，可根据开发需要选择不同的枚举；
     */
    objc_setAssociatedObject(self, str, num, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(float)height
{
    //提取属性的值:
    NSNumber *number =  objc_getAssociatedObject(self, str);
    return [number floatValue];
}


@end
