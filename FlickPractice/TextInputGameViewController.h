//
//  TextInputGameViewController.h
//  Flicker
//
//  Created by TsubasaNagasawa on 11/02/21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CLEAR_COUNT 5

@interface TextInputGameViewController : UIViewController {
	//ツールバーのラベル
	IBOutlet UILabel *toolBarLabel;
	//お題のラベル
	IBOutlet UILabel *themeLabel;
	//入力ボックス
	IBOutlet UITextField *inputTextField;
 @private
	//お題となるデータ
	NSArray *themeData;
}
//
//@property (nonatomic, retain) IBOutlet UILabel *toolBarLabel;
//@property (nonatomic, retain) IBOutlet UILabel *themeLabel;
//@property (nonatomic, retain) IBOutlet UITextField *inputTextField;

- (IBAction)checkInputTextWhenChangeTextField:(UITextField *)sender;

@end
