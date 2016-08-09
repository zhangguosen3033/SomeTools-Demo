//
//  TableViewController.m
//  UnitTestProject
//
//  Created by gdy on 16/2/24.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import "TableViewController.h"
#import "TableDataSource.h"

static NSString* const kCellIdentifier = @"cellIdentifier";

@interface TableViewController ()
@property (nonatomic, strong)TableDataSource *dataSource;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataSource = [[TableDataSource alloc]initWithItems:@[@"hello",@"world",@"nihao",@"good"] cellIdentifier:kCellIdentifier configureCellBlock:^(UITableViewCell* cell, NSString* item) {
        cell.textLabel.text = item;
    }];
    self.tableView.dataSource = _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
