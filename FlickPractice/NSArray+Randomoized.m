//
//  NSArray.m
//  TouchTheNumber
//
//  Created by TN on 10/07/13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Randomoized.h"


@implementation NSArray (Randomoized)

- (NSArray *) randomizedArray {
    NSMutableArray *results = [NSMutableArray arrayWithArray:self];
	int i = [results count];
	while (--i) {
		int j = arc4random() % (i + 1);
		[results exchangeObjectAtIndex:i withObjectAtIndex:j];
	}
	return [NSArray arrayWithArray:results];
}

@end
