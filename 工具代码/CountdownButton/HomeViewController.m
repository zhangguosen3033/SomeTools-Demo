//
//  HomeViewController.m
//  CountdownButton
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "HomeViewController.h"
#import "CutdownViewController.h"
#import "UIButton+GSbutton.h"

#import "Student.h"   //用于辅助介绍KVC  KVO

@interface HomeViewController ()<showTimeDelegate>{
    NSInteger finaNum;
    
    Student *student;
}


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    finaNum=0;
    
    
    [self creatUI];
    
    [self CreatKvcKvo];
}

-(void)CreatKvcKvo{
    
    student = [[Student alloc]init];
    
    student.name = @"班长";
    
    //KVC -->KEY VALUE CODING  <键值编码>(用法和.语法类似)
    
    //value就是值,key就是类的属性
    [student setValue:@"学委" forKey:@"name"];
    
    NSLog(@"KVC打印———%@",student.name);
    
    //KVO -->KEY VALUE Observer <键值观察者>
    //定义:假设有A.B两个类,A有一个属性,然后给A添加一个观察者B,让B观察A的属性是否发生了变化,如果属性发生变化,那么B类就会执行一个观察者方法,来获取到A类的属性变化前后的值.
    
    [student addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    student.name = @"体委";

}
//B类执行观察者方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    
    NSString *oldName = [change objectForKey:@"old"];
    
    NSString *newName = [change objectForKey:@"new"];
    
    NSLog(@"KVO打印——%@%@",oldName,newName);
    
    //观察完后,把观察者移除掉 (这句代码写在didReceiveMemoryWarning也会生效  系统在收到内存警告时会调用didReceiveMemoryWarning，KVO生效。)
    [student removeObserver:self forKeyPath:@"name"];
    
}


-(void)creatUI{
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = CGRectMake(150, 200, 100, 50);
    
    [button GS_SetMyButtonWithName:@"进入页面"];
    
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
