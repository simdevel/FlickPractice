//
//  FlickPracticeAppDelegate.h
//  FlickPractice
//
//  Created by Simdevel on 11/05/02.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlickPracticeViewController;

@interface FlickPracticeAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet FlickPracticeViewController *viewController;

@end
