//
//  Molv_gtsberegnerViewController.h
//  Molvægtsberegner
//
//  Created by Anton Eskildsen on 12/07/11.
//  Copyright 2011 Erik's Team. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MolarMassCalculator.h"

@interface Molv_gtsberegnerViewController : NSViewController <NSWindowDelegate> {
    NSTextField *stuffView;
    NSTextField *amountView;
    NSTextField *massView;
    
    NSTextField *molarMassView;
    
    NSWindow *mainWindow;
    
    NSNumber *molarMass;
    MolarMassCalculator *molarMassCalculator;
}

@property (nonatomic, retain) IBOutlet NSTextField *stuffView;
@property (nonatomic, retain) IBOutlet NSTextField *amountView;
@property (nonatomic, retain) IBOutlet NSTextField *massView;

@property (nonatomic, retain) IBOutlet NSTextField *molarMassView;

@property (nonatomic, retain) IBOutlet NSWindow *mainWindow;

- (IBAction)getCalculation:(id)sender;
- (IBAction)getMass:(id)sender;
- (IBAction)getAmount:(id)sender;

@end
