//
//  UnitTestDemoTests.m
//  UnitTestDemoTests
//
//  Created by gdy on 16/2/24.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AFNetworking/AFNetworking.h>
#import "TableDataSource.h"

#define WAIT do{\
[self expectationForNotification:@"RSBaseTest" object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
}while(0);

#define NOTIFY \
[[NSNotificationCenter defaultCenter] postNotificationName:@"RSBaseTest" object:nil];

@interface UnitTestDemoTests : XCTestCase

@end

@implementation UnitTestDemoTests

- (void)setUp {
    [super setUp];
}


- (void)tearDown {
    [super tearDown];
}

- (void)testExample {
    
    //
}

//测试异步请求1
- (void)testAsyncFounction1{
    AFHTTPRequestOperationManager* mgr = [AFHTTPRequestOperationManager manager];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [mgr GET:@"http://www.weather.com.cn/adat/sk/101110101.html" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"responObject:%@",responseObject);
        XCTAssertNotNil(responseObject,@"返回出错");
//        XCTAssertNil(responseObject,@"返回出错");
        NOTIFY
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
        XCTAssertNil(error,@"请求出错");
        NOTIFY
    }];
    WAIT
}

//测试异步请求2

- (void)testAsyncFounction2{
    XCTestExpectation* expectation = [self expectationWithDescription:@"just a demo expectation ,should pass"];//测试想得到的结果
    //异步操作
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        NSLog(@"Async test");
        XCTAssert(YES,@"should pass");
        [expectation fulfill];//通知异步测试满足条件
    });
    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
       // do something when time out
    }];
}


//测试测试用例的执行顺序
- (void)test1{
    NSLog(@"555555555555555555555");
    XCTAssertTrue(1,"can not be zero");
}

- (void)testtrue{
    NSLog(@"000000000000000000000000000");
    XCTAssertTrue(1,@"can not be zero");
}

- (void)testTrue1{
    NSLog(@"11111111111111111111111111111");
    XCTAssertTrue(1,"can not be zero");
}

- (void)testTrue2{
    NSLog(@"222222222222222222222222222222");
    XCTAssertTrue(1,"can not be zero");
}

- (void)testTrue3{
    NSLog(@"333333333333333333333333333333");
    XCTAssertTrue(1,"can not be zero");
}

//测试相等
- (void)testEqual{
    NSNumber* num1 = [NSNumber numberWithInt:1];
    NSNumber* num2 = [NSNumber numberWithInt:2];
    NSNumber* num3 = num1;
    XCTAssertEqualObjects(num1,num2,@"num1 不等于  num2");
    XCTAssertEqualObjects(num1,num3, @"num1 等于 num3");
    XCTAssertEqual(num1,num2, @"num1 不等于 num2");
    XCTAssertEqual(num1,num3, @"num1 等于num3");
    XCTAssertEqual(1,2, @"1 不等于 2");
}


//简单实用
- (void)testTableViewDataSource{
    TableDataSource* dataSource = [[TableDataSource alloc] initWithItems:@[@"1",@"2",@"3"] cellIdentifier:@"identifier" configureCellBlock:^(UITableViewCell* cell, NSString* item) {
        cell.textLabel.text = item;
    }];
    XCTAssertNotNil(dataSource,@"table data source should not be nil");
}



- (void)testPerformanceExample {
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
