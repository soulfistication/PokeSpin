//
//  ELCollectionViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELCollectionViewController.h"
#import "ELCollectionViewCell.h"
#import "ELSlotMachineViewController.h"
#import "ELSuccessViewController.h"
#import "ELPokemonRealm.h"

@interface ELCollectionViewController ()
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;
@end

@implementation ELCollectionViewController

#pragma mark - UIViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setupUI];
}

#pragma mark - SetupUI
- (void)setupUI {
	self.title = @"Collection";
}

#pragma mark - Helpers
- (BOOL)pokemonIsUnlocked:(NSInteger)number {
	if ([ELPokemonRealm objectForPrimaryKey:[NSNumber numberWithInteger:number]]) {
		return YES;
	}
	return NO;
}

#pragma mark - UICollectionView Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 18; // I decided to use only 18 Pokemons.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	ELCollectionViewCell *cell = (ELCollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:ELCellIdentifierPokemonCollectionViewCell forIndexPath:indexPath];
	
	NSString *image = nil;
	// Remember pokemon numbers start at 1 not zero.
	NSInteger pokemonNumber = indexPath.row + 1;
	NSString *pokemonNumberString = [NSString stringWithFormat:@"%ld", pokemonNumber];
	// If Pokemon is unlocked we send the filename of the image which happens to be the same as
	// the pokemon number.
	if ([self pokemonIsUnlocked:pokemonNumber]) {
		image = pokemonNumberString;
	}
	
	[cell prepareForDisplayWithLabelText:pokemonNumberString image:image];
	
	return cell;
}

#pragma mark - UICollectionvView Delegate Flow Layout
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	if ([self pokemonIsUnlocked:indexPath.row + 1]) {
		[self performSegueWithIdentifier:ELSegueIdentifierOpenPokemonUnlocked sender:indexPath];;
	} else {
		[self performSegueWithIdentifier:ELSegueIdentifierOpenSlotMachine sender:indexPath];
	}
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	CGFloat width = self.collectionView.frame.size.width;
	return CGSizeMake(width * 0.3, 100.0); // Cell width is dynamic: one third of the screen.
}

#pragma mark - ELScreenDismissable
- (void)screedDidDismissed {
	[self.collectionView reloadData];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	NSIndexPath *indexPath = (NSIndexPath *)sender;
	NSInteger pokemonNumber = indexPath.row + 1;
	if ([segue.identifier isEqualToString:ELSegueIdentifierOpenSlotMachine]) {
		ELSlotMachineViewController *slotMachineViewController = segue.destinationViewController;
		slotMachineViewController.pokemonNumber = pokemonNumber;
		slotMachineViewController.delegate = self;
	} else if ([segue.identifier isEqualToString:ELSegueIdentifierOpenPokemonUnlocked]) {
		ELSuccessViewController *successViewController = segue.destinationViewController;
		successViewController.unlocked = YES;
		successViewController.pokemonIdentifier = pokemonNumber;
		successViewController.delegate = self;
	}
}
@end
