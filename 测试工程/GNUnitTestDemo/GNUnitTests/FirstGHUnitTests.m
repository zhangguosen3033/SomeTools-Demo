//
//  FirstGHUnitTests.m
//  UnitTestDemo
//
//  Created by gdy on 16/2/24.
//  Copyright © 2016年 gdy. All rights reserved.
//




#import <GHUnitIOS/GHUnit.h>
#import "TableDataSource.h"
#import "TableViewController.h"

@interface MyTest : GHTestCase

@end

@implementation MyTest

- (void)testStrings{
    NSString* string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@",string1);
    
    GHAssertNotNil(string1, nil);
    
    NSString* string2 = @"a string";
    GHAssertEqualObjects(string1, string2, @"A custom error message,string1 should be equal to string2");
}

- (void)testSimpleFail{
    GHAssertTrue(NO, nil);
}


- (void)testDataSourceInitializing{
    TableDataSource* dataSource = [[TableDataSource alloc]initWithItems:@[@"1",@"2",@"3"] cellIdentifier:@"identifier" configureCellBlock:^(UITableViewCell* cell, NSString* item) {
        cell.textLabel.text = item;
    }];
    GHAssertNotNil(dataSource, @"tableview data source should not be nil");
}


@end
