//
//  ELPokemonRealm.h
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <Realm/Realm.h>

@class ELPokemon;

@interface ELPokemonRealm : RLMObject
@property NSInteger identifier;
@property NSString *name;
@property NSInteger weight;
@property NSInteger height;

- (instancetype)initWithModel:(ELPokemon *)pokemon;
@end
