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

@interface Contract : NSObject

+(void)precondition:(BOOL *)condition;
+(void)postcondition:(BOOL *)condition;

@end
