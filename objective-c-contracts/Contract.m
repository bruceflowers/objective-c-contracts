//
//  Contract.m
//  objective-c-contracts
//
//  Created by Bruce Flowers on 10/15/13.
//  Copyright (c) 2013 Bruce Flowers. All rights reserved.
//

#import "Contract.h"

// ***NOTE: in order to turn on exceptions, you must define THROW_CONTRACT_EXCEPTIONS in your project.


@implementation Contract


+ (void)precondition:(BOOL *)expression {
    
    #ifdef THROW_CONTRACT_EXCEPTIONS
    
        if (expression == NO) {
            [PreconditionException raise:@"Precondition not met" format:nil];
        }
    
    #endif
    
}

+ (void)postcondition:(BOOL *)expression {
    
    #ifdef THROW_CONTRACT_EXCEPTIONS
    
        if (expression == NO) {
            [PostConditionException raise:@"Postcondition not met" format:nil];
        }
    
    #endif
}


@end
