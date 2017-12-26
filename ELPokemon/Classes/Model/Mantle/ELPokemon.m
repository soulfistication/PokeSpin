//
//  ELPokemon.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELPokemon.h"

@implementation ELPokemon
#pragma mark - MTLJSONSerializing
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"identifier": @"id",
			 @"name": @"name",
			 @"baseExperience": @"base_experience",
			 @"height": @"height",
			 @"isDefault": @"is_default",
			 @"order": @"order",
			 @"weight": @"weight"
			 };
}
#pragma mark - NSObject
- (NSString *)description {
	return [NSString stringWithFormat:@"Hello, my name is: %@", self.name];
}
@end
