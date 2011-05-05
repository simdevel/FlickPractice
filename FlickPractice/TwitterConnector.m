//
//  TwitterConnector.m
//  FlickPractice
//
//  Created by SIMDEVEL on 11/02/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TwitterConnector.h"


@implementation TwitterConnector

+ (NSArray *) getHashTagDataAtGlobal:(NSString *)hashTag {
	NSString *urlString = [NSString stringWithFormat:@"http://search.twitter.com/search.json?q=%@%@", @"%23", hashTag];
	// Prepare URL request to download statuses from Twitter
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
	
	// Perform request and get JSON back as a NSData object
	NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
		
	// parse the JSON
    NSError *error = nil;
	NSDictionary *parseJsonDic = [response yajl_JSON:&error];
    
    NSArray *results;
    if (!error) {
        results = [[NSArray alloc] initWithArray:[parseJsonDic objectForKey:@"results"]];
    } else {
        results = [[NSArray alloc] initWithObjects:nil];
    }
    
	// Each element in statuses is a single status
	// represented as a NSDictionary
	NSMutableArray *tweetArray = [NSMutableArray array];
	for (NSDictionary *item in results) {
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
        
        NSString *str = [NSString stringWithString:[[item objectForKey:@"text"] 
                    stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@" #%@", hashTag] 
                                              withString:@""]];
        NSString *uname = [NSString stringWithFormat:@"@%@",[item objectForKey:@"from_user"]];
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:str, @"text", uname, @"user_name",nil];
		[tweetArray addObject:dic];
        
        [pool release];
	}
    [results release];
	return [NSArray arrayWithArray:tweetArray];
}
@end