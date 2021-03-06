//
//  FlickPracticeViewController.m
//  FlickPractice
//
//  Created by Simdevel on 11/05/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlickPracticeViewController.h"
#import "TextInputGameViewController.h"

@implementation FlickPracticeViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - delegate methods
- (void)presentStartViewController 
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Interface Builder Actions
- (IBAction)presentGameView:(id)sender
{
    TextInputGameViewController *controller = [[TextInputGameViewController alloc] initWithNibName:@"TextInputGameViewController" bundle:nil];
    [self presentModalViewController:controller animated:YES];
    [controller release];
}

- (IBAction)presentRecordsView:(id)sender
{
    
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    UIImage *bkImage = [UIImage imageNamed:@"keyboard.jpg"];
    //[[UIImage alloc] initWithContentsOfFile:@"keyboard.png"];
    self.view.backgroundColor = [UIColor colorWithPatternImage:bkImage];
    [bkImage release];
     */
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
