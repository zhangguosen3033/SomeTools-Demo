//
//  person.m
//  ToolsDemo
//
//  Created by Apple on 16/6/28.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "person.h"

@implementation person
{
    NSString *name;    //私有的
}

//@synthesize age = _age;

//初始化person属性
-(instancetype)init
{
    self = [super init];
    if(self)
    {
        name = @"Tom";
        self.age = 12;
    }
    return self;
}

//person的2个方法
-(void)func1
{
    NSLog(@"执行func1方法。");
}

-(void)func2
{
    NSLog(@"执行func2方法。");
}


//输出person对象时的方法：
-(NSString *)description
{
    return [NSString stringWithFormat:@"name:%@ age:%d",name,self.age];
}

@end

