//
//  LogViewController.m
//  CountdownButton
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "LogViewController.h"
#import "BaseViewController.h"
@interface LogViewController ()

@end

@implementation LogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
}

//一个登陆按钮
-(void)creatUI{
  
    UIButton *LogButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    LogButton.frame =CGRectMake(100, 200, 150, 50);
    
    [LogButton setTitle:@"登陆" forState:UIControlStateNormal];
    
    [LogButton addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:LogButton];

    
}

-(void)Click{
    
    BaseViewController *Base = [[BaseViewController alloc]init];
    
    [self presentViewController:Base animated:NO completion:nil];
    

    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
