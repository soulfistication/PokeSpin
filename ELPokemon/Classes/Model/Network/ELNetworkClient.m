//
//  PKNetworkClient.m
//  Pokedex
//
//  Created by MacBook Pro on 12/24/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELNetworkClient.h"
#import "ELPokemon.h"

@interface ELNetworkClient ()

@end

@implementation ELNetworkClient
+ (NSDictionary<NSString *,id> *)modelClassesByResourcePath {
	return @{
			 @"/api/v2/pokemon/#": [ELPokemon class]
			};
}
@end
