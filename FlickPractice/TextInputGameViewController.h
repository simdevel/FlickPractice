//
//  TextInputGameViewController.h
//  FlickPractice
//
//  Created by Simdevel on 11/02/21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define EXERCISE_COUNT 5
#define SCORE_SEPARATOR "/"

@interface TextInputGameViewController : UIViewController {
	IBOutlet UILabel *toolBarLabel;
	IBOutlet UILabel *themeLabel;
    IBOutlet UILabel *userNameLabel;
    IBOutlet UILabel *displayInputLabel;
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
	IBOutlet UITextField *inputTextField;
}

- (IBAction)checkInputTextWhenChangeTextField:(UITextField *)sender;
- (IBAction)changeLabelsTextWhenEndEditingTextField:(UITextField *)sender;

@end
