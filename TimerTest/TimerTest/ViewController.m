//
//  ViewController.m
//  TimerTest
//
//  Created by Apple on 16/7/29.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "JX_GCDTimerManager.h"

@interface ViewController ()
{
    NSInteger _count;
    
}
@property(nonatomic,strong)UIButton *PushBtn;

@property(nonatomic,strong)UIButton *NSTimerbtn;

@property(nonatomic,strong)UIButton *GCDbtn;

/** 定时器(这里不用带*，因为dispatch_source_t就是个类，内部已经包含了*) */
@property (nonatomic, strong) dispatch_source_t timer;

@property(nonatomic,strong)CADisplayLink *displayLink;


@property (nonatomic, strong) JX_GCDTimerManager *timerManager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _count = 10;

    
    [self CreatButton];
    
    
}

-(void)CreatButton{
    
    self.PushBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [self.PushBtn setTitle:@"跳转" forState:UIControlStateNormal];
    
    self.PushBtn.frame = CGRectMake(0, 0, 40, 35);
    
    [self.PushBtn addTarget:self action:@selector(PushBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:self.PushBtn];
    
    self.navigationItem.leftBarButtonItem = item;
    


    
                    
    
    self.NSTimerbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    
    self.NSTimerbtn.frame = CGRectMake(100, 100, 200, 80);
    
    [self.NSTimerbtn setTitle:@"NSTimer倒计时" forState:UIControlStateNormal];
    
    [self.NSTimerbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.NSTimerbtn addTarget:self action:@selector(NSTimerClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.NSTimerbtn];
    
    
    self.GCDbtn =[UIButton buttonWithType:UIButtonTypeSystem];
    
    self.GCDbtn.frame = CGRectMake(100, 220, 200, 80);
    
    [self.GCDbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.GCDbtn setTitle:@"GCD倒计时" forState:UIControlStateNormal];
    
    [self.GCDbtn addTarget:self action:@selector(GCDbtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.GCDbtn];
    
    
    
//    self.CADbtn =[UIButton buttonWithType:UIButtonTypeSystem];
//    
//    self.CADbtn.frame = CGRectMake(100, 220, 200, 80);
//    
//    [self.CADbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    
//    [self.CADbtn setTitle:@"CADbtn倒计时" forState:UIControlStateNormal];
//    
//    [self.CADbtn addTarget:self action:@selector(CADbtnClick) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:self.CADbtn];

    
    
}

//NSTimer定时器方法实现的
-(void)NSTimerClick{
    
    self.NSTimerbtn.enabled =NO; //禁止点击
    
    _count = 60;
    
    [self.NSTimerbtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [self.NSTimerbtn setTitle:@"60秒" forState:UIControlStateDisabled];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    

    
}

-(void)timerFired:(NSTimer *)timer
{
    
    if (_count !=1) {
        _count -=1;
        [self.NSTimerbtn setTitle:[NSString stringWithFormat:@"%ld秒",_count] forState:UIControlStateDisabled];
        
    }
    else
    {
        [timer invalidate];  //定时器停止
        self.NSTimerbtn.enabled = YES;
        [self.NSTimerbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [self.NSTimerbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}


//GCD定时器实现
-(void)GCDbtnClick{
    
    [[JX_GCDTimerManager sharedInstance]cancelTimerWithName:@"mytimers"];
    
        __weak typeof(self) weakSelf = self;
    
    [[JX_GCDTimerManager sharedInstance]scheduledDispatchTimerWithName:@"mytimers" timeInterval:1 queue:nil
repeats:YES actionOption:AbandonPreviousAction action:^{
    
    [weakSelf dosomthing];
    
  

}];
    
  
    
}

-(void)dosomthing{
    
    __weak typeof(self) weakSelf = self;

    _count  = _count - 1;
    
    NSLog(@"%ld",_count);
    
         dispatch_sync(dispatch_get_main_queue(), ^{
            weakSelf.GCDbtn.enabled = NO;
            
            [weakSelf.GCDbtn setTitle:[NSString stringWithFormat:@"%ld秒",_count] forState:UIControlStateNormal];
            
            
            [weakSelf.GCDbtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        });  
    
    if (_count< 1) {
        [[JX_GCDTimerManager sharedInstance] cancelTimerWithName:@"mytimers"];
        
        weakSelf.GCDbtn.enabled = YES;
                    [weakSelf.GCDbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                    [weakSelf.GCDbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _count = 10;
        
    }
    
}
//-(void)GCDbtnClick{
//    
//    __block int count = 10;
//    
//    // 获得队列
//    dispatch_queue_t queue = dispatch_get_main_queue();
//    
//    // 创建一个定时器(dispatch_source_t本质还是个OC对象)
//    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
//    
//    // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
//    // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）
//    // 何时开始执行第一个任务
//    // dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC) 比当前时间晚3秒
//    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
//    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
//    dispatch_source_set_timer(self.timer, start, interval, 0);
//    
//    // 设置回调
//    dispatch_source_set_event_handler(self.timer, ^{
//        
//        count  = count - 1;
//        
//        [self.GCDbtn setTitle:[NSString stringWithFormat:@"%d秒",count] forState:UIControlStateNormal];
//        
//        self.GCDbtn.enabled = NO;
//        
//        [self.GCDbtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//
//        
//        if (count == 0) {
//            // 取消定时器
//            dispatch_cancel(self.timer);
//            self.timer = nil;
//            
//            self.GCDbtn.enabled = YES;
//            [self.GCDbtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//            [self.GCDbtn setTitle:@"获取验证码" forState:UIControlStateNormal];
//        }
//    });
//    
//    // 启动定时器
//    dispatch_resume(self.timer);
// 
//    
//}



////CADisplay定时器
//-(void)CADbtnClick{
//    
//    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleDisplayLink:)];
//    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
//    
//}

-(void)PushBtnClick{
  
    TestViewController *test =[[TestViewController alloc]init];
    
    [self.navigationController pushViewController:test animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
