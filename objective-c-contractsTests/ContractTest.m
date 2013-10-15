//
//  ContractTest.m
//  objective-c-contracts
//
//  Created by Bruce Flowers on 10/15/13.
//  Copyright (c) 2013 Bruce Flowers. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Contract.h"

#define Precondition(x) [Contract precondition:x]
#define Postcondition(x) [Contract postcondition:x]

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

- (void)testPrecondition_MACRO_doesNotThrowIfMet
{
    XCTAssertNoThrowSpecific(Precondition(YES), PreconditionException);
}

- (void)testPostcondition_MACRO_doesNotThrowIfMet
{
    XCTAssertNoThrowSpecific(Postcondition(YES), PostConditionException);
}

- (void)testPrecondition_MACRO_throwsIfNotMet
{
    XCTAssertThrowsSpecific(Precondition(NO), PreconditionException);
}

- (void)testPostcondition_MACRO_throwsIfNotMet
{
    XCTAssertThrowsSpecific(Postcondition(NO), PostConditionException);
}

- (void)testPrecondition_doesNotThrowIfMet
{
    XCTAssertThrowsSpecific([Contract precondition:NO], PreconditionException);
}

- (void)testPostcondition_doesNotThrowIfMet
{
    XCTAssertThrowsSpecific([Contract postcondition:NO], PostConditionException);
}

- (void)testPrecondition_throwsIfNotMet
{
    XCTAssertThrowsSpecific([Contract precondition:NO], PreconditionException);
}

- (void)testPostcondition_throwsIfNotMet
{
    XCTAssertThrowsSpecific([Contract postcondition:NO], PostConditionException);
}

@end
