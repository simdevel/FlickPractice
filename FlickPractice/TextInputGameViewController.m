//
//  TextInputGameViewController.m
//  FlickPractice
//
//  Created by Simdevel on 11/05/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextInputGameViewController.h"

#import "NSArray+Randomoized.h"
#import "TwitterConnector.h"
#import "EndingGameViewController.h"

static NSArray *themeData;
static NSInteger complateCount;
static NSInteger currentIndex;

@interface TextInputGameViewController(Private)
- (NSArray *)loadThemeData:(NSString *)datasourceType;
- (void)changeLabels;
- (BOOL)isComplate;
@end

@implementation TextInputGameViewController
//@synthesize toolBarLabel, themeLabel, inputTextField;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
 return self;
}
*/

- (NSArray *)loadThemeData:(NSString *)datasourceType {
    NSArray *ret;
	if ([datasourceType isEqualToString:@"plist"]) {
		ret = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"themeStringFile" ofType:@"plist"]];
	} else if ([datasourceType isEqualToString:@"tweet"]) {
        NSString *hashTag = @"flickpracticetheme";
        ret = [NSArray arrayWithArray:[TwitterConnector getHashTagDataAtGlobal:hashTag]];
    }
	return [ret randomizedArray];
}

- (void)changeLabels {
    NSDictionary *dic = [themeData objectAtIndex:currentIndex];
    themeLabel.text = [dic objectForKey:@"text"];
    userNameLabel.text = [dic objectForKey:@"user_name"];
    scoreLabel.text = [NSString stringWithFormat:@"%d %s %d",currentIndex + 1, SCORE_SEPARATOR, complateCount];
    displayInputLabel.text = @"";
}

- (BOOL)isComplate {
    //return YES;
    return (currentIndex + 1 > complateCount);
}
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

#pragma mark - Interface Builder Actions

- (IBAction) checkInputTextWhenChangeTextField:(UITextField *)sender {
    
    displayInputLabel.text = sender.text;
    if ([sender.text isEqualToString:themeLabel.text]) {
        //sender.text = @"";
        [sender resignFirstResponder];
        [sender becomeFirstResponder];
        if ([self isComplate]) {
            [self resignFirstResponder];
            EndingGameViewController *conttoller = [[EndingGameViewController alloc] initWithNibName:@"EndingGameViewController" bundle:nil];
            [self presentModalViewController:conttoller animated:YES];
            [conttoller release];
        }
	}
}

- (IBAction)changeLabelsTextWhenEndEditingTextField:(UITextField *)sender
{
    ++currentIndex;
    if (![self isComplate]) {
        sender.text = @"";
        [self changeLabels];
    }
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
    //Load data
	themeData = [[NSArray alloc] initWithArray:[self loadThemeData:@"tweet"]];
    
    //Initalize counters
    currentIndex = 0;
    complateCount = ([themeData count] < EXERCISE_COUNT) ? [themeData count] : EXERCISE_COUNT;
	
    [self changeLabels];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:YES];
	//show keyboard
	[inputTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[themeData release];themeData = nil;
    [super dealloc];
}

@end
