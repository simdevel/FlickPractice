//
//  EndingGameViewController.h
//  FlickPractice
//
//  Created by Simdevel on 11/05/05.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EndingGameViewController : UIViewController {
    IBOutlet UILabel *msgLabel;
    IBOutlet UILabel *timeLabel;
    IBOutlet UIButton *retryButton;
    IBOutlet UIButton *endButton;
    IBOutlet UIButton *showRecordButton;
}

- (IBAction)retryButtonDidTouchUpInside:(id)sender;
- (IBAction)endButtonDidTouchUpInside:(id)sender;
- (IBAction)showRecordButtonDidTouchUpInside:(id)sender;
@end
