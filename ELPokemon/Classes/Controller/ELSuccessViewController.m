//
//  ELSuccessViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/26/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <libextobjc/extobjc.h>
#import <Realm/Realm.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "ELSuccessViewController.h"
#import "ELNetworkClient.h"
#import "ELEnvironment.h"
#import "ELPokemon.h"
#import "ELPokemonRealm.h"

@interface ELSuccessViewController ()
@property (nonatomic, strong) ELNetworkClient *client;
@property (weak, nonatomic) IBOutlet UIImageView *pokemonImageView;
@property (weak, nonatomic) IBOutlet UILabel *pokemonNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokemonWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokemonHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokemonBaseExperienceLabel;
@end

@implementation ELSuccessViewController
#pragma mark - UIViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:241.0/255.0 blue:252/255.0 alpha:1.0];
	
	self.client = [[ELNetworkClient alloc] initWithBaseURL:[NSURL URLWithString:[ELEnvironment isDevelopmentEnvironment] ? ELNetworkClientBaseURL : ELNetworkClientBaseURLDevelopment]];
	
	if (self.unlocked) {
		[self updateUI];
	} else {
		[SVProgressHUD show];
		
		@weakify(self)
		[self.client GET:[NSString stringWithFormat:@"/api/v2/pokemon/%ld" , self.pokemonIdentifier] parameters:nil completion:^(OVCResponse * _Nullable response, NSError * _Nullable error) {
			@strongify(self)
			[SVProgressHUD dismiss];
			ELPokemon *pokemon = response.result;
			ELPokemonRealm *pokemonRealm = [[ELPokemonRealm alloc] initWithModel:pokemon];
			
			if (![ELPokemonRealm objectForPrimaryKey:pokemon.identifier]) {
				RLMRealm *realm = [RLMRealm defaultRealm];
				[realm beginWriteTransaction];
				[realm addObject:pokemonRealm];
				[realm commitWriteTransaction];
			}
			
			[self updateUI];
		}];
	}
}

#pragma mark - Setup UI
- (void)updateUI {
	self.pokemonImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", self.pokemonIdentifier]];
	
	ELPokemonRealm *pokemonRealm = [ELPokemonRealm objectForPrimaryKey:[NSNumber numberWithInteger:self.pokemonIdentifier]];
	
	self.pokemonNameLabel.text = pokemonRealm.name;
	self.pokemonWeightLabel.text = [NSString stringWithFormat:@"%ld", pokemonRealm.weight];
	self.pokemonHeightLabel.text = [NSString stringWithFormat:@"%ld", pokemonRealm.height];
	self.pokemonBaseExperienceLabel.text = [NSString stringWithFormat:@"%ld", pokemonRealm.baseExperience];
}

#pragma mark - IBAction
- (IBAction)closeButtonTapped:(id)sender {
	[self dismissViewControllerAnimated:YES completion:^{
		if ([self.delegate respondsToSelector:@selector(screedDidDismissed)]) {
			[self.delegate screedDidDismissed];
		}
	}];
}
@end
