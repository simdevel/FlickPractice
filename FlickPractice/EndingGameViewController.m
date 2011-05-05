//
//  EndingGameViewController.m
//  FlickPractice
//
//  Created by Simdevel on 11/05/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EndingGameViewController.h"


@implementation EndingGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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

#pragma mark - Interface Builder Actions

- (IBAction)retryButtonDidTouchUpInside:(id)sender
{
    
}

- (IBAction)endButtonDidTouchUpInside:(id)sender
{
    if([self parentViewController]) {
        [[[self parentViewController] parentViewController] dismissModalViewControllerAnimated:YES];
    }
    //[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)showRecordButtonDidTouchUpInside:(id)sender
{
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *imgName = [NSString stringWithFormat:@"comp%d.jpg", arc4random() % 5];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imgName]];
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
