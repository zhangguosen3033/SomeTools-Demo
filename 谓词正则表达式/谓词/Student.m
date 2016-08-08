//
//  Student.m
//  谓词
//
//  Created by Apple on 16/8/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void) setPid: (int) p{
    
    pid=p;
}

-(void) setName: (NSString*) n{
    
    
    name=n;
}

-(void) setHeight: (float) h{
    
    height=h;
}








-(int) pid{
    return pid;
}

-(NSString*) name{
    return name;
}

-(float) height{
    return height;
}

@end
