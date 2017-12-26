//
//  PKEnvironment.m
//  Pokedex
//
//  Created by MacBook Pro on 12/24/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELEnvironment.h"

@implementation ELEnvironment
#pragma mark - Development
+ (BOOL)isDevelopmentEnvironment {
	if (DEBUG) {
		return YES;
	}
	return NO;
}
@end
