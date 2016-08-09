//
//  MockTableTests.m
//  UnitTestDemo
//
//  Created by gdy on 16/2/24.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "TableDataSource.h"

@interface MockTableTests : XCTestCase

@end

@implementation MockTableTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

//mock  测试用例1
- (void)testNumberOfRows{
    TableDataSource* dataSource = [[TableDataSource alloc]initWithItems:@[@"hello",@"world",@"good"] cellIdentifier:@"identifier" configureCellBlock:^(UITableViewCell* cell, NSString* item) {
        cell.textLabel.text = item;
    }];
    //mock 出一个 table view
    id mockObject = [OCMockObject mockForClass:[UITableView class]];
    XCTAssertEqual(3,[dataSource tableView:mockObject numberOfRowsInSection:0], @"mock table returns a bad number of rows in section 0");
}

//mock 测试用例2

- (void)testCellConfiguration{
    __block UITableViewCell* configuredCell = nil;
    __block id configuredObject = nil;
    TableViewCellConfigureBlock block = ^(UITableViewCell* cell,id item){
        configuredCell = cell;
        configuredObject = item;
    };
    
    TableDataSource* dataSource = [[TableDataSource alloc]initWithItems:@[@"a",@"b"] cellIdentifier:@"identifier" configureCellBlock:block];
    //mock出一个tableview
    id mockTableView = [OCMockObject mockForClass:[UITableView class]];
    
    //设定mock tableview的行为
    UITableViewCell* cell = [[UITableViewCell alloc]init];
    //如果UITableview调用了dequeue方法，就会返回对应的cell（expect表示该方法必须被调用）
    [[[mockTableView expect] andReturn:cell] dequeueReusableCellWithIdentifier:@"identifier"];
//    [[[mockTableView stub] andReturn:cell] dequeueReusableCellWithIdentifier:@"identifier"];
    
    //主动调用cellForRowAtIndex方法，触发tableview调用dequeue
    id result = [dataSource tableView:mockTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    //验证mock tableview的行为
    [mockTableView verify];
    //断言
    XCTAssertEqual(result,cell, @"应该删除虚构的cell");
    XCTAssertEqual(configuredCell,cell, @"this should have been passed to the block");
    XCTAssertEqualObjects(configuredObject,@"a", @"this should have been passed to the block");
}





- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
