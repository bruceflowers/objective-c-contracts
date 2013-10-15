//
//  ContractTest.m
//  objective-c-contracts
//
//  Created by Bruce Flowers on 10/15/13.
//  Copyright (c) 2013 Bruce Flowers. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Contract.h"

@interface ContractTest : XCTestCase

@end

@implementation ContractTest {
}

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testPrecondition
{
    XCTAssertThrowsSpecific([Contract precondition:NO], PreconditionException);
}

- (void)testPostcondition
{
    XCTAssertThrowsSpecific([Contract postcondition:NO], PostConditionException);
}

@end
