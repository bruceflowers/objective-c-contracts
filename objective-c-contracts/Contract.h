//
//  Contract.h
//  objective-c-contracts
//
//  Created by Bruce Flowers on 10/15/13.
//  Copyright (c) 2013 Bruce Flowers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PreconditionException.h"
#import "PostConditionException.h"

// ***NOTE: in order to turn on exceptions, you must define THROW_CONTRACT_EXCEPTIONS in your project.
// #define THROW_CONTRACT_EXCEPTIONS 1

#define Precondition(x) [Contract precondition:x]
#define Postcondition(x) [Contract postcondition:x]


@interface Contract : NSObject

+(void)precondition:(BOOL *)condition;
+(void)postcondition:(BOOL *)condition;

@end
