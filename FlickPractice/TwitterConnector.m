//
//  TwitterConnector.m
//  Flicker
//
//  Created by SIMDEVEL on 11/02/24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TwitterConnector.h"


@implementation TwitterConnector

+ (NSArray *) getHashTagDataAtGlobal:(NSString *)hashTag {
	printf("twitter connect...");
	NSString *urlString = [NSString stringWithFormat:@"http://search.twitter.com/search.json?q=%@%@", @"%23", hashTag];
	
	// Prepare URL request to download statuses from Twitter
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
	
	// Perform request and get JSON back as a NSData object
	NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
	
	// Get JSON as a NSString from NSData response
	//NSString *json_string = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
	
	// parse the JSON
	NSArray *results = [response yajl_JSON];
	
	// Each element in statuses is a single status
	// represented as a NSDictionary
	NSMutableArray *tweetArray = [NSMutableArray array];
	for (NSDictionary *item in results) {
		//exclude hashtags
		[tweetArray addObject:[[item objectForKey:@"text"] stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@" #%@", hashTag] withString:@""]];
	}
	return [NSArray arrayWithArray:tweetArray];
}
@end