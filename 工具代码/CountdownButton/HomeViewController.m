//
//  HomeViewController.m
//  CountdownButton
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "HomeViewController.h"
#import "CutdownViewController.h"
@interface HomeViewController ()<showTimeDelegate>{
    NSInteger finaNum;
}


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    finaNum=0;

    
    [self creatUI];
}

-(void)creatUI{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(150, 200, 100, 50);
    
    [button setTitle:@"进入页面" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(playInputClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

-(void)playInputClick{
    
    CutdownViewController *Cutdown =[[CutdownViewController alloc]init];
    
    Cutdown.numvalues = finaNum;
    
    Cutdown.delegate=self;

    [self.navigationController pushViewController:Cutdown animated:NO];
    
}

//实现代理里面的方法
-(void)sendTime:(CutdownViewController *)Cutdown time:(NSInteger)num{
    
    //把上个页面的值付给他   
    finaNum = num;
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
