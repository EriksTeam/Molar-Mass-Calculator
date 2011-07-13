//
//  Molv_gtsberegnerViewController.m
//  Molvægtsberegner
//
//  Created by Anton Eskildsen on 12/07/11.
//  Copyright 2011 Erik's Team. All rights reserved.
//

#import "Molv_gtsberegnerViewController.h"
#import "MolarMassCalculator.h"

@implementation Molv_gtsberegnerViewController

@synthesize stuffView, amountView, massView;
@synthesize molarMassView;
@synthesize mainWindow;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        molarMassCalculator = [[MolarMassCalculator alloc] init];
    }
    return self;
}

- (IBAction)getCalculation:(id)sender {
    molarMass = [molarMassCalculator calculateMolarMass:stuffView.stringValue];
    molarMassView.stringValue = [NSString stringWithFormat:@"%2$f g/mol", [molarMass doubleValue]];
}

- (IBAction)getMass:(id)sender {
    massView.stringValue = [NSString stringWithFormat:@"%f g", [molarMass doubleValue] *
                            [amountView.stringValue doubleValue]];
}

- (IBAction)getAmount:(id)sender {
    amountView.stringValue = [NSString stringWithFormat:@"%f mol", [massView.stringValue doubleValue] /
                              [molarMass doubleValue]];
}

- (void)awakeFromNib {
    [mainWindow setDelegate:self];
}

- (void)windowWillClose:(NSNotification *)notification {
    [NSApp terminate: self];
}

@end
