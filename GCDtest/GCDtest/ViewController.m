//
//  ViewController.m
//  GCDtest
//
//  Created by Apple on 16/7/21.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"
@interface ViewController ()

@property(nonatomic,strong)UIImageView *imageview;

@property(nonatomic,strong)UIImageView *imageview2;


/** 定时器(这里不用带*，因为dispatch_source_t就是个类，内部已经包含了*) */
@property (nonatomic, strong) dispatch_source_t timer;

@property(nonatomic,strong)UIButton *button;

@property(nonatomic,strong)UIButton *button2;


@end

@implementation ViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    

    
    
}
-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    dispatch_cancel(self.timer);
    self.timer = nil;    //中断定时器的执行
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatUI];
    
//    [self test1]; //子线程加载  主线程刷新UI
    
    [self test2];  //从网络上下载两张不同的图片，然后显示到不同的UIImageView上去  分组并发执行
    [self test3];  //延时几秒
    
    [self test4];  //定时器  GCD定时器与NStimer的区别
    
}

-(void)creatUI{
    
    self.imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, 200, 200)];
    
     self.imageview2 = [[UIImageView alloc]initWithFrame:CGRectMake(210, 64, 200, 200)];
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.button.frame = CGRectMake(100, 300, 100, 50);
    
    [self.button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button setTitle:@"多点几次" forState:UIControlStateNormal];
    
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    self.button2.frame = CGRectMake(100, 400, 100, 50);
    
    [self.button2 addTarget:self action:@selector(clicked2) forControlEvents:UIControlEventTouchUpInside];
    
    [self.button2 setTitle:@"下一页" forState:UIControlStateNormal];
    
    [self.view addSubview:self.imageview];
    
    [self.view addSubview:self.imageview2];
    
    [self.view addSubview:self.button];
    
    [self.view addSubview:self.button2];


    
}

-(void)test1{
    
    //1.获取一个全局串行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //2.把任务添加到队列中执行
    dispatch_async(queue, ^{
        
        //打印当前线程
        NSLog(@"test1：%@",[NSThread currentThread]);
        
        //3.从网络上下载图片
        NSURL *urlstr=[NSURL URLWithString:@"http://h.hiphotos.baidu.com/baike/w%3D268/sign=30b3fb747b310a55c424d9f28f444387/1e30e924b899a9018b8d3ab11f950a7b0308f5f9.jpg"];
        NSData *data=[NSData dataWithContentsOfURL:urlstr];
        UIImage *image=[UIImage imageWithData:data];
        //提示
        NSLog(@"test1：图片加载完毕");
        
         dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageview.image=image;
            //打印当前线程
            NSLog(@"test1：%@",[NSThread currentThread]);
        });
    });
    
    
}

// 根据url获取UIImage
- (UIImage *)imageWithURLString:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    // 这里并没有自动释放UIImage对象
    return [[UIImage alloc] initWithData:data];
}

//创建一个分组  里面的任务都完成了  在通知完成了任务
-(void)test2{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 异步下载图片
    dispatch_async(queue, ^{
        // 创建一个组
        dispatch_group_t group = dispatch_group_create();
        
        __block UIImage *image1 = nil;
        __block UIImage *image2 = nil;
        
        // 关联一个任务到group
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 下载第一张图片
            NSString *url1 = @"http://car0.autoimg.cn/upload/spec/9579/u_20120110174805627264.jpg";
            image1 = [self imageWithURLString:url1];
        });
        
        // 关联一个任务到group
        dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            // 下载第一张图片
            NSString *url2 = @"http://hiphotos.baidu.com/lvpics/pic/item/3a86813d1fa41768bba16746.jpg";
            image2 = [self imageWithURLString:url2];
        });
        
        // 等待组中的任务执行完毕,回到主线程执行block回调
        dispatch_group_notify(group, dispatch_get_main_queue(), ^{
            
            self.imageview.image = image1;
            self.imageview2.image = image2;
            
        });
        
    });
}

-(void)clicked{
    
    //需求：点击控制器只有第一次点击的时候才打印。
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"点也没用该行代码只执行一次");
    });

    
}

-(void)test3{
    
    NSLog(@"已经走到了这个函数");
    
    // 延迟2秒执行：
    double delayInSeconds = 3.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

        NSLog(@"延迟了三秒执行");
    
    });
    
}


-(void)test4{
    
   __block int count = 0;
    
     UILabel *label = [[UILabel alloc]init];
    
    label.frame = CGRectMake(100, 400, 100, 50);
    
    [self.view addSubview:label];
    
    // 获得队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 创建一个定时器(dispatch_source_t本质还是个OC对象)
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
    // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）
    // 何时开始执行第一个任务
    // dispatch_time(DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC) 比当前时间晚3秒
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    
    // 设置回调
    dispatch_source_set_event_handler(self.timer, ^{
        
        
        NSLog(@"------------%@", [NSThread currentThread]);
        
        NSLog(@"%d",count);
        
        label.text = [NSString stringWithFormat:@"%d",count];
        
        count  = count + 1;
        
        if (count == 60) {
            // 取消定时器
            dispatch_cancel(self.timer);
            self.timer = nil;
            
            label.text = @"haha";
        }
    });
    
    // 启动定时器
    dispatch_resume(self.timer);
    
    
}


//跳转到下一页
-(void)clicked2{
  
    SecViewController *sec = [[SecViewController alloc]init];
    
    [self.navigationController pushViewController:sec animated:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
