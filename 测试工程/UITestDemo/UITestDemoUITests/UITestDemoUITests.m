//
//  UITestDemoUITests.m
//  UITestDemoUITests
//
//  Created by gdy on 16/2/25.
//  Copyright © 2016年 gdy. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UITestDemoUITests : XCTestCase

@end

@implementation UITestDemoUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];//启动测试app
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    
}

- (void)testLogin{
//    XCUIApplication *app = [[XCUIApplication alloc] init];//代表整个app的对象
//    XCUIElement *element = [[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"View"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
//    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
//    [textField doubleTap];
//    [textField typeText:@"123"];
//    [element tap];
//    
//    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
//    [textField2 tap];
//    [textField2 typeText:@"123"];
//    [app.buttons[@"login"] tap];
//    [[[[app.navigationBars[@"UIView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
    
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    XCUIElement *element = [[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"View"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
//    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
//    [textField tap];
//    
//    XCUIElement *moreNumbersKey = app.keys[@"more, numbers"];
//    [moreNumbersKey tap];
//    [moreNumbersKey tap];
//    [textField typeText:@"123"];
//    
//    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
//    [textField2 tap];
//    [moreNumbersKey tap];
//    [moreNumbersKey tap];
//    [textField2 typeText:@"123"];
//    
//    XCUIElement *loginButton = app.buttons[@"login"];
//    [loginButton tap];
//    [[[[app.navigationBars[@"UIView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
//    [loginButton tap];
    
    
    
    
}

@end
