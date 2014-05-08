//
//  ContractTest.m
//  objective-c-contracts
//
//  Created by Bruce Flowers on 10/15/13.
//  Copyright (c) 2013 Bruce Flowers. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Contract.h"
#import "PreConditionException.h"

#define THROW_CONTRACT_EXCEPTIONS 1


@interface ContractTest : XCTestCase

@end


@implementation ContractTest


- (void)testPrecondition_MACRO_doesNotThrowIfTrue
{
    XCTAssertNoThrowSpecific(Precondition(YES==YES), PreConditionException);
}

- (void)testPostcondition_MACRO_doesNotThrowIfTrue
{
    XCTAssertNoThrowSpecific(Postcondition(YES==YES), PostConditionException);
}

- (void)testPrecondition_MACRO_throwsIfNotTrue
{
    XCTAssertThrowsSpecific(Precondition(YES==NO), PreConditionException);
}

- (void)testPostcondition_MACRO_throwsIfNotTrue
{
    XCTAssertThrowsSpecific(Postcondition(YES==NO), PostConditionException);
}

- (void)testPrecondition_MACRO_throwsSpecificWithReason
{
    NSString *reason = STRINGIFY_EXPRESSION(YES==NO);
    XCTAssertThrowsSpecificWithReason(Precondition(YES==NO), PreConditionException, reason);
}

- (void)testPostcondition_MACRO_throwsSpecificWithReason
{
    NSString *reason = STRINGIFY_EXPRESSION(YES==NO);
    XCTAssertThrowsSpecificWithReason(Postcondition(YES==NO), PostConditionException, reason);
}


@end
