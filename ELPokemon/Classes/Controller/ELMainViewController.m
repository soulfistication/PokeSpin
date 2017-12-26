//
//  ELMainViewController.m
//  Pokedex
//
//  Created by MacBook Pro on 12/24/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELMainViewController.h"

@interface ELMainViewController ()

@end

@implementation ELMainViewController
#pragma mark - UIViewController
- (void)viewDidLoad {
	[super viewDidLoad];
}

#pragma mark - IBActions
- (IBAction)triggerSegueTapped:(id)sender {
	[self performSegueWithIdentifier:ELSegueIdentifierOpenPokeDex sender:self];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:ELSegueIdentifierOpenPokeDex]) {
		/* Pass data to PokeDex */
	}
}
@end
