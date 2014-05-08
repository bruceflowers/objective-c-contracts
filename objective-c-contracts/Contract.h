//
//  Contract.h
//  objective-c-contracts
//
//  Created by Bruce Flowers on 10/15/13.
//  Copyright (c) 2013 Bruce Flowers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PreConditionException.h"
#import "PostConditionException.h" 


// ***NOTE: in order to turn on the throwing of exceptions, you must define THROW_CONTRACT_EXCEPTIONS in your project.


#define XCTAssertThrowsSpecificWithReason(expression, exception_class, reason, format...) \
_XCTPrimitiveAssertThrowsSpecificWithReason(expression, exception_class, reason, format)

#define _XCTPrimitiveAssertThrowsSpecificWithReason(expression, exception_class, reason, format...) \
({ \
    BOOL __caughtException = NO; \
    @try { \
    (expression); \
    } \
    @catch (exception_class *exception) { \
        __caughtException = YES; \
        if (![reason isEqualToString:[exception reason]]) { \
            _XCTRegisterFailure(_XCTFailureDescription(_XCTAssertion_ThrowsSpecificNamed, 0, @#expression, @#exception_class, [exception class], [exception name], [exception reason]),format); \
        } \
    }\
    @catch (id exception) { \
        __caughtException = YES; \
        _XCTRegisterFailure(_XCTFailureDescription(_XCTAssertion_ThrowsSpecificNamed, 1, @#expression, @#exception_class, [exception class], [exception name], [exception reason]),format); \
    }\
    if (!__caughtException) { \
        _XCTRegisterFailure(_XCTFailureDescription(_XCTAssertion_ThrowsSpecificNamed, 2, @#expression, @#exception_class),format); \
    } \
})


#define STRINGIFY_EXPRESSION(EXP) ({\
    const char *expressionString = #EXP; \
    NSString *expression = [NSString stringWithCString:expressionString encoding:NSStringEncodingConversionAllowLossy]; \
    expression; \
})

// NOTE: where Contract precondition:(x), x MUST be wrapped in parentheses or it will not evaluate properly
#define Precondition(x) ({\
    const char *expressionString = #x; \
    NSString *expression = [NSString stringWithCString:expressionString encoding:NSStringEncodingConversionAllowLossy]; \
    [Contract precondition:(x) stringifiedExpression:expression]; \
})

#define Postcondition(x) ({\
    const char *expressionString = #x; \
    NSString *expression = [NSString stringWithCString:expressionString encoding:NSStringEncodingConversionAllowLossy]; \
    [Contract postcondition:(x) stringifiedExpression:expression]; \
})



@interface Contract : NSObject

+(void)precondition:(BOOL)expression stringifiedExpression:(NSString *)stringified;
+(void)postcondition:(BOOL)expression stringifiedExpression:(NSString *)stringified;

@end
