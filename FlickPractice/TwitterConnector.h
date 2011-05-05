//
//  TwitterConnector.h
//  FlickPractice
//
//  Created by SIMDEVEL on 11/02/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YAJLiOS/YAJL.h>

@interface TwitterConnector : NSObject {

}
+ (NSArray *) getHashTagDataAtGlobal:(NSString *)hashTag;
@end
