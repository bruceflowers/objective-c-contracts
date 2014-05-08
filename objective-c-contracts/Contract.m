//
//  Contract.m
//  objective-c-contracts
//
//  Created by Bruce Flowers on 10/15/13.
//  Copyright (c) 2013 Bruce Flowers. All rights reserved.
//

#import "Contract.h"

// ***NOTE: in order to turn on exceptions, you must define THROW_CONTRACT_EXCEPTIONS in your project.


static NSString *const ContractViolation = @"ContractViolation";


@implementation Contract


+ (void)precondition:(BOOL)expression stringifiedExpression:(NSString *)stringified {

    if (!expression) {

        NSLog(@"Violated contract precondition: %@", stringified);

        // Developer can look at the log's stack trace to see what calling code caused the exception

#ifdef THROW_CONTRACT_EXCEPTIONS
            NSLog(@"%@", [NSThread callStackSymbols]);
            NSException *exception = [PreConditionException exceptionWithName:ContractViolation reason:stringified userInfo:nil];
            [exception raise];
#endif

    }

}

+ (void)postcondition:(BOOL)expression stringifiedExpression:(NSString *)stringified {

    if (!expression) {

        NSLog(@"Violated contract postcondition: %@", stringified);

#ifdef THROW_CONTRACT_EXCEPTIONS
            NSLog(@"%@", [NSThread callStackSymbols]);
            NSException *exception = [PostConditionException exceptionWithName:ContractViolation reason:stringified userInfo:nil];
            [exception raise];
#endif

    }

}


@end
