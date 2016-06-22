//
//  CutdownViewController.m
//  ToolsDemo
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "CutdownViewController.h"
#import "FinishiewController.h"
@interface CutdownViewController ()
{
    NSInteger num;
    
    NSInteger secNum;
    
    NSTimer *firstTimer;
    NSTimer *secondTimer;
    
}

@property(nonatomic,strong)UIButton * startBtn;

@property(nonatomic,strong)UIButton * endBtn;

@end

@implementation CutdownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self CreatUI];

    num=60;//第一次倒计时的时间
    secNum=self.numvalues;//切换页面后剩余的倒计时时间
    if (self.numvalues!=0) {
        [firstTimer invalidate]; //第一个倒计时结束
        [self setBtnStatus:200];
        [self showTitle:@"secondSend"];
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(finaShowTime:) userInfo:nil repeats:YES];
    }
    else{
        [self setBtnStatus:100];
    }



}

-(void)CreatUI{
    
    self.startBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    
    self.startBtn.frame = CGRectMake(150, 200, 100, 50);
    
    [self.startBtn addTarget:self action:@selector(Click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.startBtn];
    
    
    self.endBtn =[UIButton buttonWithType:UIButtonTypeSystem];
    
    self.endBtn.frame = CGRectMake(150, 400, 100, 50);
    
    [self.endBtn setTitle:@"完成" forState:UIControlStateNormal];
    
    [self.endBtn addTarget:self action:@selector(endClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.endBtn];

    
    
}

-(void)endClick{
    
    FinishiewController *finish = [[FinishiewController alloc]init];
    
    [self.navigationController pushViewController:finish animated:YES];

    
}

-(void)Click{
    
    [self setBtnStatus:200];
    [self showTitle:@"firstSend"];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showTime:) userInfo:nil repeats:YES];
}

/** 倒计时操作 */
-(void)showTime:(NSTimer *)timerParam{
    
    firstTimer=timerParam;
    num-=1;
    
    if (num==0) {
        [self userDelegate];
        [self setBtnStatus:100];
        [timerParam invalidate];
        num=60;
    }else{
        
        [self userDelegate];
        [self setBtnStatus:200];
        [self showTitle:@"firstSend"];
    }
}
/** 切换页面后的倒计时剩余时间 */
-(void)finaShowTime:(NSTimer *)timerT{
    //    NSLog(@"得到的值:%zi",secNum);
    
    secondTimer=timerT;
    secNum-=1;
    
    if(secNum==0){
        self.numvalues=0;
        [self setBtnStatus:100];
        [timerT invalidate];
    }
    else{
        [self setBtnStatus:200];
        [self showTitle:@"secondSend"];
    }
}
/** 按钮的状态 */
-(void)setBtnStatus:(NSInteger)numSet{
    if (numSet==100) { //100 是可以点击发送时的状态
        [self.startBtn setBackgroundColor:[UIColor orangeColor]];
        self.startBtn.enabled=YES;
        [self.startBtn setTitle:@"点击发送" forState:UIControlStateNormal];
    }
    if (numSet==200) { //200 倒计时的状态
        self.startBtn.enabled=NO;
        [self.startBtn setBackgroundColor:[UIColor colorWithRed:222.0/255.0f green:222.0/255.0f blue:21.0/255.0f alpha:1.0f]];
    }
}
/** 按钮显示的文字 */
-(void)showTitle:(NSString *)sendStr{
    if ([sendStr isEqualToString:@"firstSend"]) {
        [self.startBtn setTitle:[NSString stringWithFormat:@"重新发送(%zi)",num] forState:UIControlStateNormal];
    }
    if ([sendStr isEqualToString:@"secondSend"]) {
        [self.startBtn setTitle:[NSString stringWithFormat:@"重新发送(%zi)",secNum] forState:UIControlStateNormal];
    }
}
/** 实现代理 */
-(void)userDelegate{
    if ([self.delegate respondsToSelector:@selector(sendTime:time:)]) {
        [self.delegate sendTime:self time:num]; //传递时间
    }
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
