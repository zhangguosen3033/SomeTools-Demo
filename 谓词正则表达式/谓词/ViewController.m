//
//  ViewController.m
//  谓词
//
//  Created by Apple on 16/8/8.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "GSRegularExpression.h"
@interface ViewController ()
{
    UITextField *_textfiled;
    
    UIButton *_btn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self Testdata];
    
    [self CreatUI];
    
    
    
}

-(void)CreatUI{
    
    _textfiled=[[UITextField alloc]initWithFrame:CGRectMake(100, 200, 300, 40)];
    
    _textfiled.placeholder = @"请输入验证内容";
    
    [self.view addSubview:_textfiled];
    
    _btn =[UIButton buttonWithType:UIButtonTypeSystem];
    
    _btn.frame = CGRectMake(120, 300, 100, 50);
    
    [_btn setTitle:@"验证" forState:UIControlStateNormal];
    
    [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_btn];
    
    
}

-(void)click{
    
    if ([GSRegularExpression GS_isMobileNumber:_textfiled.text]) {
        
        NSLog(@"输入的是正常的手机号码");
        
    }else{
        
        NSLog(@"输入的不是正常的手机号码");
        
    }
    
    if ([GSRegularExpression GS_isEmailQualified:_textfiled.text]) {
        
        NSLog(@"输入的是正常的邮箱格式");
        
    }else{
        
        NSLog(@"输入的不是正常的邮箱格式");
    }
    
    
}

-(void)Testdata{
    NSMutableArray *array=[NSMutableArray arrayWithCapacity: 5];
    
    Student *student1=[[Student alloc] init];
    [student1 setPid: 1];
    [student1 setName: @"xiaoming"];
    [student1 setHeight: 168];
    [array addObject: student1];
    
    
    Student *student2=[[Student alloc] init];
    [student2 setPid: 2];
    [student2 setName: @"dahuang"];
    [student2 setHeight: 178];
    [array addObject: student2];
    
    
    Student *student3=[[Student alloc] init];
    [student3 setPid: 3];
    [student3 setName: @"erhuang"];
    [student3 setHeight: 188];
    [array addObject: student3];
    //创建谓词，条件是pid>1 并且height<188.0。其实谓词也是基于KVC 的，也就是如
    // 果pid 在person 的成员变量xxx 中，那么此处要写成xxx.pid>1。
    NSPredicate *pre = [NSPredicate predicateWithFormat:
                        @" pid>1 and height<188.0"];
    int i=0;
    for(;i<[array count];i++){
        Student *stu=[array objectAtIndex: i];
        //遍历数组，输出符合谓词条件的Person 的name。
        if ([pre evaluateWithObject: stu]) {
            NSLog(@"11--%@",[stu name]);
        }
    }
    
    
    
    //快速筛选数组内容   以及占位符的使用
    NSPredicate *pre2 = [NSPredicate predicateWithFormat:@"pid>%d",1];
    
    NSMutableArray *arrayPre2=[array filteredArrayUsingPredicate: pre2];
    
    NSLog(@"%@",[[arrayPre2 objectAtIndex: 0] name]);
    
    
    //name以x开头的
    NSPredicate  *predicate3 = [NSPredicate predicateWithFormat:@"name BEGINSWITH 'x'"];
    
    for(i=0;i<[array count];i++){
        Student *stu=[array objectAtIndex: i];
        //遍历数组，输出符合谓词条件的Person 的name。
        if ([predicate3 evaluateWithObject: stu]) {
            NSLog(@"33——————%@",[stu name]);
        }
    }
    
    //name以g结尾的
    NSPredicate  *predicate4 = [NSPredicate predicateWithFormat:@"name ENDSWITH 'g'"];
    
    for(i=0;i<[array count];i++){
        Student *stu=[array objectAtIndex: i];
        //遍历数组，输出符合谓词条件的Person 的name。
        if ([predicate4 evaluateWithObject: stu]) {
            NSLog(@"44——————%@",[stu name]);
        }
    }
    
    
    //name中包含字符a的
    NSPredicate  *predicate5 = [NSPredicate predicateWithFormat:@"name CONTAINS 'a'"];
    
    for(i=0;i<[array count];i++){
        Student *stu=[array objectAtIndex: i];
        //遍历数组，输出符合谓词条件的Person 的name。
        if ([predicate5 evaluateWithObject: stu]) {
            NSLog(@"55——————%@",[stu name]);
        }
    }
    
    
    
    //like 匹配任意多个字符
    //name中只要有r字符就满足条件
    NSPredicate  *predicate6 = [NSPredicate predicateWithFormat:@"name like '*r*'"];
    for(i=0;i<[array count];i++){
        Student *stu=[array objectAtIndex: i];
        //遍历数组，输出符合谓词条件的Person 的name。
        if ([predicate6 evaluateWithObject: stu]) {
            NSLog(@"66——————%@",[stu name]);
        }
    }
    
    
    //?代表一个字符，下面的查询条件是：name中第二个字符是r的
    NSPredicate  *predicate7 = [NSPredicate predicateWithFormat:@"name like '*?r*'"];
    for(i=0;i<[array count];i++){
        Student *stu=[array objectAtIndex: i];
        //遍历数组，输出符合谓词条件的Person 的name。
        if ([predicate7 evaluateWithObject: stu]) {
            NSLog(@"77——————%@",[stu name]);
        }
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
