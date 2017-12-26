//
//  ELPokemonRealm.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELPokemonRealm.h"
#import "ELPokemon.h"

@implementation ELPokemonRealm
#pragma mark - init
- (instancetype)initWithModel:(ELPokemon *)pokemon {
	self = [super init];
	
	if (self) {
		self.identifier = pokemon.identifier.integerValue;
		self.name = pokemon.name;
		self.weight = pokemon.weight.integerValue;
		self.height = pokemon.height.integerValue;
		self.baseExperience = pokemon.baseExperience.integerValue;
	}
	
	return self;
}
#pragma mark - RLMObject
+ (NSString *)primaryKey {
	return @"identifier";
}
@end
