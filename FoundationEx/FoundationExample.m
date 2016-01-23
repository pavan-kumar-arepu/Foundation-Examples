//
//  FoundationExample.m
//  
//
//  Created by Pavankumar Arepu on 23/01/2016.
//
//

#import "FoundationExample.h"

@implementation FoundationExample

-(void)viewDidLoad
{
    NSLog(@"%s",__func__);
    
    
    NSLog(@"Hi This is Awesome!");
    
    NSString *sampleString = @"Hi This is Objective Session";
    
    NSLog(@"sampleSting: %@ ",sampleString);
    
    
    NSString *immutableString = @"This is an example String to show immutable Nature";
    
    
    
    NSMutableString *sampleString1;
    
    
    NSMutableString *sampleString2;
    
    
    
    
    
    sampleString1 = [NSMutableString stringWithString: @"Hi this is string1 Content"];

    
    sampleString2 = sampleString1;
    
  
    
    [sampleString2 appendString: @" I just apended to String2"];
    
    
    
    NSLog (@"string1 = %@", sampleString1);
    
    
    
    
    NSLog (@"string2 = %@", sampleString2);
    
    
}

@end
