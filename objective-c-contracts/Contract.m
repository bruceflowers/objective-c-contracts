//
//  Contract.m
//  objective-c-contracts
//
//  Created by Bruce Flowers on 10/15/13.
//  Copyright (c) 2013 Bruce Flowers. All rights reserved.
//

#import "Contract.h"

@implementation Contract

+ (void)precondition:(BOOL *)expression {
    if (expression == NO) {
        [PreconditionException raise:@"Precondition not met" format:nil];
    }
}

+ (void)postcondition:(BOOL *)expression {
    if (expression == NO) {
        [PostConditionException raise:@"Postcondition not met" format:nil];
    }
}

@end
