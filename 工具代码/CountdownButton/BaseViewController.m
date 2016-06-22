//
//  BaseViewController.m
//  CountdownButton
//
//  Created by Apple on 16/6/22.
//  Copyright © 2016年 张国森. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeViewController.h"
#import "MeseeageViewController.h"
#import "MineViewController.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self CreatTabBar];

}

-(void)CreatTabBar{
    
    HomeViewController *Home = [[HomeViewController alloc]init];
    
    UINavigationController *HomeNav = [[UINavigationController alloc]initWithRootViewController:Home];
    
    MeseeageViewController *Message = [[MeseeageViewController alloc]init];
    
    UINavigationController *MessageNav = [[UINavigationController alloc]initWithRootViewController:Message];
    
    MineViewController *Mine = [[MineViewController alloc]init];
    
    UINavigationController *MineNav = [[UINavigationController alloc]initWithRootViewController:Mine];
    
    self.viewControllers = @[HomeNav,MessageNav,MineNav];
    
    NSArray *array = self.viewControllers;
    
    NSArray *titleArray =  @[@"首页",@"信息",@"个人中心"];
    
    NSArray *SimagesArray = @[@"icon_activity_pressed_57x49@2x", @"icon_route_pressed_57x49@2x", @"icon_me_pressed_57x49@2x"];
    
    
    NSArray *imagesArray = @[@"icon_activity_57x49@2x",  @"icon_route_57x49@2x", @"icon_me_57x49@2x"];
    
    for (int i = 0; i < array.count ; i++) {
        
        UIViewController *vc= array[i];
        
        vc.tabBarItem = [[UITabBarItem alloc]initWithTitle:titleArray[i] image:[[UIImage imageNamed:imagesArray[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed: SimagesArray[i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        vc.tabBarItem.imageInsets = UIEdgeInsetsMake(8, 0, -8, 0);
        
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
