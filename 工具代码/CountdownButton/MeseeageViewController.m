//
//  MeseeageViewController.m
//  CountdownButton
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "MeseeageViewController.h"
#import "person.h"
#import "person+PersonCategory.h"
#import <objc/runtime.h>    //使用runtime 必须包含头文件
@interface MeseeageViewController ()

@end

@implementation MeseeageViewController
{
    person *per;  //创建一个person实例
}

- (void)viewDidLoad {
    [super viewDidLoad];
    per = [[person alloc]init]; //记得要初始化

}

/*1.获取person所有的成员变量*/
- (IBAction)getAllVariable:(UIButton *)sender {
    unsigned int count = 0;
    //获取类的一个包含所有属性变量的列表，IVar是runtime声明的一个宏，是实例变量的意思.
    Ivar *allVariables = class_copyIvarList([person class], &count);
    
    for(int i = 0;i<count;i++)
    {
        //遍历每一个变量，包含名称和类型（此处没有"*"）
        Ivar ivar = allVariables[i];
        const char *Variablename = ivar_getName(ivar);          //获取成员变量名称
        const char *VariableType  = ivar_getTypeEncoding(ivar); //获取成员变量类型
        NSLog(@"(Name: %s) ----- (Type:%s)",Variablename,VariableType);
    }
    
}

/*2.获取person所有方法*/
- (IBAction)getAllMethod:(UIButton *)sender {
    unsigned int count;
    //获取方法列表，所有在.m文件显式实现的方法都会被找到，包括setter+getter方法：
    Method *allMethods = class_copyMethodList([person class], &count);
    for(int i =0;i<count;i++)
    {
        //Method：runtime声明的一个宏，表示一个方法
        Method md = allMethods[i];
        //获取SEL：SEL类型,即获取方法选择器@selector()
        SEL sel = method_getName(md);
        //得到sel的方法名：以字符串格式获取sel的name，也即@selector()中的方法名称
        const char *methodname = sel_getName(sel);
        NSLog(@"(Method:%s)",methodname);
    }
}

/*3.改变person的name变量属性*/
- (IBAction)changeVariable:(UIButton *)sender {
    
    NSLog(@"改变前的person：%@",per);
    
    unsigned int count = 0;
    Ivar *allList = class_copyIvarList([person class], &count);
    
    //从第一个方法getAllVariable中输出的控制台信息，我们可以看到name为第一个实例属性；
    Ivar ivv = allList[0];
    //name属性Tom被强制改为Mike。
    object_setIvar(per, ivv, @"Mike");
    NSLog(@"改变之后的person：%@",per);
}

/* 4.添加新的属性*/
- (IBAction)addVariable:(UIButton *)sender {
    per.height = 12;           //给新属性height赋值
    NSLog(@"%f",[per height]); //访问新属性值
}

/*5.添加新的方法试试(这种方法等价于对Father类添加Category对方法进行扩展)：*/
- (IBAction)addMethod:(UIButton *)sender {
    
    /* 动态添加方法：
     第一个参数表示Class cls 类型；
     第二个参数表示待调用的方法名称；
     第三个参数(IMP)myAddingFunction，IMP一个函数指针，这里表示指定具体实现方法myAddingFunction；
     第四个参数表方法的参数，0代表没有参数；
     */
    class_addMethod([per class], @selector(NewMethod), (IMP)myAddingFunction, 0);
    
    //调用 【如果使用[per method]方法！(在ARC下会报no visible @interface 错误)】
    [per performSelector:@selector(NewMethod)];
}

//具体的实现（方法的内部都默认包含两个参数Class类和SEL方法，被称为隐式参数。）
int myAddingFunction(id self, SEL _cmd)
{
    NSLog(@"已新增方法:NewMethod");
    return 1;
}

/*6.交换两种方法之后（功能对调），可以试试让苹果乱套 */
- (IBAction)replaceMethod:(UIButton *)sender {
    
    Method method1 = class_getInstanceMethod([person class], @selector(func1));
    Method method2 = class_getInstanceMethod([person class], @selector(func2));
    method_exchangeImplementations(method1, method2);
    [per func1];  //输出交换后的效果，需要对比的可以尝试下交换前运行func1；
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
