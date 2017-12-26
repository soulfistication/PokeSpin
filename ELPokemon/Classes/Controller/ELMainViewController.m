//
//  ELMainViewController.m
//  Pokedex
//
//  Created by MacBook Pro on 12/24/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <Realm/Realm.h>
#import <libextobjc/extobjc.h>
#import "ELMainViewController.h"
#import "ELPokemonRealm.h"

@interface ELMainViewController ()
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@end

@implementation ELMainViewController
#pragma mark - UIViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setupUI];
}

#pragma mark - Setup UI
- (void)setupUI {
	self.infoTextView.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:241.0/255.0 blue:252/255.0 alpha:1.0];
	
	self.view.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:241.0/255.0 blue:252/255.0 alpha:1.0];
}

#pragma mark - IBActions
- (IBAction)triggerSegueTapped:(id)sender {
	[self performSegueWithIdentifier:ELSegueIdentifierOpenPokeDex sender:self];
}

- (IBAction)resetProgressTapped:(id)sender {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Confirm reset progress" message:@"Are you sure you want to erase your precious Pokemon?" preferredStyle:UIAlertControllerStyleAlert];
	
	[alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
	}]];
	
	@weakify(self)
	[alertController addAction:[UIAlertAction actionWithTitle:@"Reset Progress" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
		@strongify(self)
		[self resetProgress];
	}]];
	
	[self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Helpers
- (void)resetProgress {
	RLMRealm *realm = [RLMRealm defaultRealm];
	[realm transactionWithBlock:^{
		for (ELPokemonRealm *pokemonRealm in [ELPokemonRealm allObjects]) {
			[realm deleteObject:pokemonRealm];
		}
	}];
}
@end
