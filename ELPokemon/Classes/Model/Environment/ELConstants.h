//
//  PKConstans.h
//  Pokedex
//
//  Created by MacBook Pro on 12/24/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#ifndef ELConstans_h
#define ELConstans_h

/* Segue Identifiers */

static NSString * const ELSegueIdentifierOpenPokeDex = @"ELSegueIdentifierOpenPokeDex";
static NSString * const ELSegueIdentifierOpenSlotMachine = @"ELSegueIdentifierOpenSlotMachine";
static NSString * const ELSegueIdentifierOpenSuccessSlotMachine = @"ELSegueIdentifierOpenSuccessSlotMachine";
static NSString * const ELSegueIdentifierOpenAlreadyWonPokemon = @"ELSegueIdentifierOpenAlreadyWonPokemon";

/* Cell Identifiers */

static NSString * const ELCellIdentifierPokemonCollectionViewCell = @"ELCellIdentifierPokemonCollectionViewCells";

/* API URLs */

static NSString * const ELNetworkClientBaseURL = @"https://pokeapi.co";
static NSString * const ELNetworkClientBaseURLDevelopment = @"https://pokeapi.co";

static NSString * const ELNetworkClientPokemonEndpoint = @"pokemon";

#endif /* ELConstans_h */
