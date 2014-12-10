//
//  InterfaceController.m
//  MyCalculator WatchKit Extension
//
//  Created by New on 12/1/14.
//  Copyright (c) 2014 New. All rights reserved.
//
//things to do
// 1)maybe menu is where i can put all the operations
// 2)after the equals sign, keep previous result but be able to enter in new numbers as well
// 3)if current and previous are full, then preform operation for continuous input
// 4)take in account "order of operations"

#import "InterfaceController.h"

@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *displayLabel;
@property (strong, nonatomic) NSMutableString * currentInput;
@property (strong, nonatomic) NSString * previousInput;
@property (nonatomic) char operationState;

//new hope?
@property (strong, nonatomic) NSString * displayInput;
@end

@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
        _currentInput = [[NSMutableString alloc] init];
        
        NSLog(@"%@ initWithContext", self);
    }
    return self;
}

#pragma mark - Number Input
- (IBAction)one {
    [self.currentInput appendString:@"1"];
    [self.displayLabel setText:_currentInput];
    //NSLog(@"current %@", _currentInput);
    //NSLog(@"previous %@", _previousInput);
 }
- (IBAction)two {
    [self.currentInput appendString:@"2"];
    [self.displayLabel setText:_currentInput];
}
- (IBAction)three {
    [self.currentInput appendString:@"3"];
    [self.displayLabel setText:_currentInput];
}
- (IBAction)four {
    [self.currentInput appendString:@"4"];
    [self.displayLabel setText:_currentInput];
}
- (IBAction)five {
    [self.currentInput appendString:@"5"];
    [self.displayLabel setText:_currentInput];
    //NSLog(@"current %@", _currentInput);
    //NSLog(@"previous %@", _previousInput);
}
- (IBAction)six {
    [self.currentInput appendString:@"6"];
    [self.displayLabel setText:_currentInput];
}
- (IBAction)seven {
    [self.currentInput appendString:@"7"];
    [self.displayLabel setText:_currentInput];
}
- (IBAction)eight {
    [self.currentInput appendString:@"8"];
    [self.displayLabel setText:_currentInput];
}
- (IBAction)nine {
    [self.currentInput appendString:@"9"];
    [self.displayLabel setText:_currentInput];
}
- (IBAction)zero {
    char firstCharacter = [self.currentInput characterAtIndex:0];
    if (firstCharacter == 0)
    {
        return;
    }
    else
    {
        [self.currentInput appendString:@"0"];
        [self.displayLabel setText:_currentInput];
    }
}

#pragma mark - decimal
- (IBAction)decimal {
    [self.currentInput appendString:@"."];
    [self.displayLabel setText:_currentInput];
}


// use the menu to use operations, not sure if this is intuitive or not
// but it does save space on the watch face
// worth?
#pragma mark - Operations
- (IBAction)subtract {
    self.previousInput = [[NSString alloc] initWithString:_currentInput];
    [self.currentInput setString:@""];
    [self.displayLabel setText:@"0"];
    self.operationState = '-';
}
- (IBAction)add {
    self.previousInput = [[NSString alloc] initWithString:_currentInput];
    [self.currentInput setString:@""];
    [self.displayLabel setText:@"0"];
    self.operationState = '+';
}
- (IBAction)multiply {
    self.previousInput = [[NSString alloc] initWithString:_currentInput];
    [self.currentInput setString:@""];
    [self.displayLabel setText:@"0"];
    self.operationState = 'x';
}
- (IBAction)divide {
    self.previousInput = [[NSString alloc] initWithString:_currentInput];
    [self.currentInput setString:@""];
    [self.displayLabel setText:@"0"];
    self.operationState = '/';
}

#pragma mark - Resolution
- (IBAction)equals {
    if (_operationState == '-')
    {
        NSString * result = [NSString stringWithFormat:@"%.1f",
                             [self.previousInput floatValue] - [self.currentInput floatValue]];
        [self.currentInput setString:result];
        [self.displayLabel setText:_currentInput];
        self.operationState = '0';
    }
    if (_operationState == '+')
    {
        NSString * result = [NSString stringWithFormat:@"%.1f",
                             [self.previousInput floatValue] + [self.currentInput floatValue]];
        [self.currentInput setString:result];
        [self.displayLabel setText:_currentInput];
        self.operationState = '0';
    }
    if (_operationState == 'x')
    {
        NSString * result = [NSString stringWithFormat:@"%.1f",
                             [self.previousInput floatValue] * [self.currentInput floatValue]];
        [self.currentInput setString:result];
        [self.displayLabel setText:_currentInput];
        self.operationState = '0';
    }
    if (_operationState == '/')
    {
        NSString * result = [NSString stringWithFormat:@"%.1f",
                             [self.previousInput floatValue] / [self.currentInput floatValue]];
        [self.currentInput setString:result];
        [self.displayLabel setText:_currentInput];
        self.operationState = '0';
    }
    else {
        return;
    }
}

- (IBAction)clear {
    [_displayLabel setText:@"0"];
    [_currentInput setString:@""];
    _previousInput = @"";
    self.operationState = 0;
}

#pragma mark - De/Activate
- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end



