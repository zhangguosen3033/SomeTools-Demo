//
//  ViewController.m
//  算法练习
//
//  Created by Apple on 16/8/9.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *p = [[NSMutableArray alloc] initWithObjects:@"3",@"5",@"4",@"1",@"9",@"0",nil];
    
    for (int i = 0; i<p.count; i++)
    {
        for (int j=i+1; j<p.count; j++)
        {
            int a = [p[i] intValue];
            
            int b = [p[j] intValue];
           
            if (a > b)
            {
                [p replaceObjectAtIndex:i withObject:p[j]];
                
                [p replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d",a]];
            }
        }
    }
   
    NSLog(@"%@",p);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
