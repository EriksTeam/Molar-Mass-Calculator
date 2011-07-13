//
//  MolarMassCalculator.m
//  Molvægtsberegner
//
//  Created by Anton Eskildsen on 12/07/11.
//  Copyright 2011 Erik's Team. All rights reserved.
//

#import "MolarMassCalculator.h"

@implementation MolarMassCalculator

- (id)init
{
    self = [super init];
    if (self) {
        molarMassTable = [[NSDictionary alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"molarMassTable" ofType:@"plist"]];
                          
    }
    
    return self;
}

- (NSNumber *)calculateMolarMass:(NSString *)input {
    double returnValue = 0;
    
    int count = 0;
    NSString *currentString = @"";
    int multiplier = 1;
    while (count < [input length]) {
        do {
            currentString = [currentString stringByAppendingString:
                        [input substringWithRange:NSMakeRange(count, 1)]];
            count++;
            
            if ([currentString isEqualToString:@"*"]) {
                multiplier = [[input substringWithRange:NSMakeRange(count, 1)] intValue];
            }
        } while (count < [input length] 
                 && !isupper([input characterAtIndex:count]) 
                 && !isnumber([input characterAtIndex:count])
                 && isalnum([input characterAtIndex:count]));
        if (count < [input length] && isnumber([input characterAtIndex:count])) {
            returnValue += 
            [[molarMassTable objectForKey:currentString] doubleValue] * 
            [[input substringWithRange:NSMakeRange(count, 1)] doubleValue] * multiplier;
            count++;
        }
        else
            returnValue += 
            [[molarMassTable objectForKey:currentString] doubleValue] * multiplier;
        
        currentString = @"";
    }
    
    return [NSNumber numberWithDouble:returnValue];
}

@end
