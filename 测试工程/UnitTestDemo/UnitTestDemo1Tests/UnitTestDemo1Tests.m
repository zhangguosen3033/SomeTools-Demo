//
//  UnitTestDemo1Tests.m
//  UnitTestDemo1Tests
//
//  Created by gdy on 16/2/25.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DataModel.h"
#import "UIImage+Scale.h"

@interface UnitTestDemo1Tests : XCTestCase

@end

@implementation UnitTestDemo1Tests

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

- (void)testModelDefaultID{
    DataModel* model = [[DataModel alloc]init];
    XCTAssertEqual(model.myID,100, @"the default should be 100");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    UIImage* image = [UIImage imageNamed:@"scan_guide_mask"];
    [self measureBlock:^{
        UIImage* resizedImage = [UIImage imageWithImage:image scaledToSize:CGSizeMake(100, 100)];
        XCTAssertNotNil(resizedImage,@"resizedImage should not be nil");
        CGFloat width = resizedImage.size.width;
        CGFloat height = resizedImage.size.height;
        XCTAssert(width == 100 && height == 100,@"the size if not right");
    }];
}

@end
