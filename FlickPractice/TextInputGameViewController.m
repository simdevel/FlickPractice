//
//  TextInputGameViewController.m
//  FlickPractice
//
//  Created by TsubasaNagasawa on 11/05/03.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TextInputGameViewController.h"

#import "NSArray+Randomoized.h"
#import "TwitterConnector.h"

@interface TextInputGameViewController(Private)
-(NSArray *)loadThemeData:(NSString *)datasourceType;
-(void)changeThemeLabel;
-(void)changeCountLabel;
@end

@implementation TextInputGameViewController
//@synthesize toolBarLabel, themeLabel, inputTextField;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
     printf("hoge");
 if (self) {
 // Custom initialization.
 }
 return self;
 }



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    printf("hoge");
    [super viewDidLoad];
	//Load Data
	//themeData = [[NSArray alloc] initWithArray:[self loadThemeData:@"guideLine"]];
	themeData = [[NSArray alloc] initWithArray:[self loadThemeData:@"tweet"]];
	[self changeThemeLabel];
}

- (void)viewDidAppear:(BOOL)animated {
    printf("aaaaa");
    /*
	[super viewDidAppear:YES];
	toolBarLabel.text = [NSString stringWithFormat:@"0 / %d", CLEAR_COUNT];
	//キーボードを表示
	[inputTextField becomeFirstResponder];
     */
}

- (IBAction) checkInputTextWhenChangeTextField:(UITextField *)sender {
    if ([sender.text isEqualToString:themeLabel.text]) {
		printf("OKOK");
		sender.text = @""; 
		[self changeThemeLabel];
	}
}

- (void)changeThemeLabel {
    //self.themeLabel.text = [[themeData randomizedArray] objectAtIndex:0];
}

- (void)changeCountLabel {
    //    self.toolBarLabel.text = [NSString stringWithFormat:@"", ];
}

- (NSArray *)loadThemeData:(NSString *)datasourceType {
    static NSArray *ret;
	if (ret == nil) {
	    NSString *hashTag = @"flikerapptheme";
		if ([datasourceType isEqualToString:@"guideLine"]) {
			ret = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"guideLine" ofType:@"plist"]];
		} else if ([datasourceType isEqualToString:@"tweet"]) {
			ret = [TwitterConnector getHashTagDataAtGlobal:hashTag];
		}
	}
	return ret;
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

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
