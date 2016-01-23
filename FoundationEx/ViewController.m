//
//  ViewController.m
//  FoundationEx
//
//  Created by Pavankumar Arepu on 24/09/15.
//  Copyright (c) 2015 PPAM. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *myTimer;
@property (nonatomic, strong) UIProgressView *myProgressBar;
@property (weak, nonatomic) IBOutlet UILabel *myLabel;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@end

@implementation ViewController
float receivedData = 0.0;
float  xpectedTotalSize = 100.0;


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *simpleString = @"";
//    
//    
//    NSLog(@"simple String: %@", simpleString);
//    
//    
//    _myLabel.text = simpleString;
//    
//    self.myProgressBar = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
//    
//    [self.view addSubview:self.myProgressBar];
//    
//    self.myProgressBar.frame = CGRectMake(self.view.frame.size.width/2 - 60, self.view.frame.size.height/2 + 90, 120, 80);
//
//    
//    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateUI:) userInfo:nil repeats:YES];
//    
//    self.myProgressBar.tintColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0  alpha:1.0];
    
    
    
    /*
    //Copy Objects. This is an important concept to understand (Why mutable vs. Immutable)
    -(id)copy;
    -(id)mutablecopy
    */

    /*
    //NSString:
    
NSMutableString: NSMutableString objects provide methods to modify the underlying array of characters they represent, while NSString does not. For example, NSMutableString exposes methods such as appendString, deleteCharactersInRange, insertString, replaceOccurencesWithString, etc. All these methods operate on the string as it exists in memory.
    
    NSString: on the other hand only is a create-once-then-read-only string if you will; you'll find that all of its "manipulation" methods (substring, uppercaseString, etc) return other NSString objects and never actually modify the existing string in memory.
    
     
     */
    
    //Creating Strings
    
    NSString *make = @"BenZ";
    NSString *model = @"511";
    int year = 2001;
    NSString *message = [NSString stringWithFormat:@"That's a %@ %@ from %d!",
                         make, model, year];
    NSLog(@"%@", message);
    MYLog(@"dssdfsd %@",message);

    //Enumerating Strings
    
    
    for (int i=0; i<[make length]; i++) {
        unichar letter = [make characterAtIndex:i];
        char charLetter = [make characterAtIndex:i];
        NSLog(@"%d: %hu --> %c", i, letter,charLetter);
    }

    
    NSNumber *nuber = @2;
    
    NSNumber * underline = @(NSUnderlineStyleDouble);
    
    NSLog(@"Under :%@", underline);
    
    
    //Comparing Strings
    
    NSString *car = @"Porsche Boxster";
    NSString *car2 = @"BENZ";

    if ([car isEqualToString:@"Porsche Boxster"]) {
        NSLog(@"That car is a Porsche Boxster");
    }
    if ([car hasPrefix:@"Porsche"]) {
        NSLog(@"That car is a Porsche of some sort");
    }
    if ([car hasSuffix:@"Carrera"]) {
        // This won't execute
        NSLog(@"That car is a Carrera");
    }
    
    
//    And, just like NSNumber, NSString has a compare: method that can be useful for alphabetically sorting strings:
    
    NSString *otherCar = @"Ferrari";
    NSComparisonResult result = [car compare:otherCar];
    if (result == NSOrderedAscending)
    {
        NSLog(@"The letter 'P' comes before 'F'");
    } else if (result == NSOrderedSame)
    {
        NSLog(@"We're comparing the same string");
    } else if (result == NSOrderedDescending)
    {
        NSLog(@"The letter 'P' comes after 'F'");
    }
    
    
//    Combining Strings
//    
//    The two methods presented below are a way to concatenate NSString objects. But, remember that NSString is an immutable type, so these methods actually return a new string and leave the original arguments unchanged.
    
    NSString *make1 = @"Ferrari";
    NSString *model2 = @"458 Spider";
    NSString *car1 = [make1 stringByAppendingString:model2];
    NSLog(@"%@", car1);        // Ferrari458 Spider
    car2 = [make1 stringByAppendingFormat:@" %@", model2];
    NSLog(@"%@", car2);
    
    //Searching Sting:
    
    NSString *newString = @"We are running Fifth Session are";
    NSRange searchResult = [newString rangeOfString:@"Session"];
    if (searchResult.location == NSNotFound)
    {
        NSLog(@"Search string was not found");
    } else {
        NSLog(@"'Session' starts at index %lu and is %lu characters long",
              searchResult.location,        // 13
              searchResult.length);         // 6
    }
    
    
    
    //SubDividing Strings:
    
    NSLog(@"%@", [newString substringToIndex:7]);
    NSLog(@"%@", [newString substringFromIndex:7]);
    NSRange range = NSMakeRange(7, 7);
    NSLog(@"%@", [newString substringWithRange:range]);
    
    
    
    
//    Replacing Substrings
//    Replacing part of a string is just like subdividing a string, except you provide a replacement along with the substring you’re looking for. The following snippet demonstrates the two most common substring replacement methods.
    
//    NSRange newRange = NSMakeRange(20,15);
//    NSString *replaceString = [newString stringByReplacingCharactersInRange:newRange
//                                                     withString:@"Sixth"];
//    NSLog(@"%@", replaceString);
    NSString *replaceString = [newString stringByReplacingOccurrencesOfString:@"are"
                                                       withString:@""];
//    NSLog(@"%@", evora);          // Lotus Evora

    /*
     
     NSArray:
     
     Order Collection of Objects.
     
     Immutable. That's right, one you create the arry, you cant add or remove objects. 
     All objects in the array are held onto strongly.
     Usually created by manipulating other array or with @[].
     
     You already know these key methods:
     
     -(NSUInteger) count;
     -(id)objectAtIndex:(NSUinteger)index //Crashs if index is out of bounds
    -(id)lastObject // Retrun nil(doesn't crash) if there are no objcts in the array;
     
     
     But there are lot of very interested methods in this class Example:
     
     -(NSArray *)sortedArrayUsingSelector:(SEL)aSelector;
     -(void)makeObjectsPerformSelctor:(SEL)aSelector withObject:(id)selectorArgument;
     -(NSString* )compnentsJoinedByString:(NSString *)separator;
     
     
     
     
     NSArray *myArray = [[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
     
     NSLog(@"myArray %@",myArray );
     
     
     
     // create an immutable array
     NSArray *arr = [NSArray arrayWithObjects: @"one", @"two", @"three", nil ];
     
     
     
     // create a mutable copy, and mutate it
     NSMutableArray *mut = [arr mutableCopy];
     [mut removeObject: @"one"];
     
     

     
     
     */
    
    
    /*
    NSDictionary *colors = @{ @"Green" : [UIColor greenColor],
                              @"Blue" : [UIColor blueColor],
                              @"Yellow" : [UIColor yellowColor] };
    
    NSLog(@"Color Dictionary:%@",colors);
    
    
    */
    
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"That is a test attributed string."];
    [str addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:NSMakeRange(3,5)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(10,7)];
    [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:8.0] range:NSMakeRange(20, 10)];
    [str addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleThick) range:NSMakeRange(0, [str length])];
    
    _myLabel.attributedText = str;
//    
    NSArray *wordsInString = [[self.myLabel.attributedText string] componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSLog(@"wordsInString:%@",wordsInString);
    
    NSLog(@"Attr str:%@",str);

    
    // String patterns//
    
    NSString *string1 = @"Srinivas is good boy, I am also good boy ";
    
    NSUInteger count = 0, length = [string1 length];
    NSRange range1 = NSMakeRange(0, length);
    while(range1.location != NSNotFound)
    {
        range1 = [string1 rangeOfString: @"good" options:0 range:range1];
        if(range1.location != NSNotFound)
        {
            range1 = NSMakeRange(range1.location + range1.length, length - (range1.location + range1.length));
            count++; 
        }
    }
    
    NSLog(@"count :%lu",(unsigned long)count);
    
    /*
     
     
     NSString immtString = [[NSString alloc]initWithObject:@"one"];
     
     immtString = @"two";
     
     
     
     */
    
    
    
    
    
    //NSObject:
    //  -(NSString *)decription is a useful method to override (its's %@ in NSLog())
    
    
    
    UIFont *font = [UIFont systemFontOfSize:8];
    NSLog(@"FontDescription:%@",[font description]);
    
    NSMutableArray *fontsArray = [NSMutableArray arrayWithCapacity:0];
    for(int index = 0; index < 10; index++) {
        [fontsArray addObject:font];
    }
    
    
    NSLog(@"FontsArrayDescription:%@",[fontsArray description]);
    
    
    

    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)updateUI:(NSTimer *)timer
{
    static int count =0; count++;
    
    if (count <=10)
    {
        self.progressLabel.text = [NSString stringWithFormat:@"%d %%",count*10];
        self.myProgressBar.progress = (float)count/10.0f;
    } else
    {
        [self.myTimer invalidate];
        self.myTimer = nil;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
