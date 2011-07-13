//
//  MolarMassCalculator.h
//  Molvægtsberegner
//
//  Created by Anton Eskildsen on 12/07/11.
//  Copyright 2011 Erik's Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MolarMassCalculator : NSObject {
    NSDictionary *molarMassTable;
}

- (id)init;

- (NSNumber *)calculateMolarMass:(NSString *)input;

@end
