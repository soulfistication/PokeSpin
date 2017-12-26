//
//  ELSuccessViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/26/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <Realm/Realm.h>
#import "ELSuccessViewController.h"
#import "ELNetworkClient.h"
#import "ELEnvironment.h"
#import "ELPokemon.h"
#import "ELPokemonRealm.h"

@interface ELSuccessViewController ()
@property (nonatomic, strong) ELNetworkClient *client;
@end

@implementation ELSuccessViewController
#pragma mark - UIViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.client = [[ELNetworkClient alloc] initWithBaseURL:[NSURL URLWithString:[ELEnvironment isDevelopmentEnvironment] ? ELNetworkClientBaseURL : ELNetworkClientBaseURLDevelopment]];
	
	[self.client GET:@"/api/v2/pokemon/2" parameters:nil completion:^(OVCResponse * _Nullable response, NSError * _Nullable error) {
		ELPokemon *pokemon = response.result;
		ELPokemonRealm *pokemonRealm = [[ELPokemonRealm alloc] initWithModel:pokemon];
		
		if (![ELPokemonRealm objectForPrimaryKey:pokemon.identifier]) {
			RLMRealm *realm = [RLMRealm defaultRealm];
			[realm beginWriteTransaction];
			[realm addObject:pokemonRealm];
			[realm commitWriteTransaction];
		}
		
	}];
}

@end