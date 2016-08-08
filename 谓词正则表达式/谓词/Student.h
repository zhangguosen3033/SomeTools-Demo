//
//  Student.h
//  谓词
//
//  Created by Apple on 16/8/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

{
    int pid;
    NSString *name;
    float height;
}

-(void) setPid: (int) pid;

-(void) setName: (NSString*) name;

-(void) setHeight: (float) height;

-(int) pid;

-(NSString*) name;

-(float) height;

@end
