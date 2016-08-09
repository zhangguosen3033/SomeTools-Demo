//
//  ViewController.m
//  UITestDemo
//
//  Created by gdy on 16/2/25.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *usernameTF;
@property (strong, nonatomic) IBOutlet UITextField *passwordTF;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapHandle:)];
    [self.view addGestureRecognizer:tap];
}

- (void)tapHandle:(UITapGestureRecognizer*)tap{
    [_usernameTF resignFirstResponder];
    [_passwordTF resignFirstResponder];
}


- (IBAction)loginClicked:(id)sender {
    if (([_usernameTF.text isEqualToString:@"123"]) && ([_passwordTF.text isEqualToString:@"123"])) {
        UIViewController* vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = [UIColor redColor];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
