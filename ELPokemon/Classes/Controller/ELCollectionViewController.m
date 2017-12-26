//
//  ELCollectionViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <Realm/Realm.h>
#import "ELCollectionViewController.h"
#import "ELCollectionViewCell.h"
#import "ELSlotMachineViewController.h"

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
	self.title = @"My Pokemon Collection";
}

#pragma mark - UICollectionView Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 18;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	ELCollectionViewCell *cell = (ELCollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:ELCellIdentifierPokemonCollectionViewCell forIndexPath:indexPath];
	
	[cell prepareForDisplayWithLabelText:[NSString stringWithFormat:@"%ld", indexPath.row + 1] image:@"pokemonImage"];
	
	return cell;
}

#pragma mark - UICollectionvView Delegate Flow Layout
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	[self performSegueWithIdentifier:ELSegueIdentifierOpenSlotMachine sender:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	CGFloat width = self.collectionView.frame.size.width;
	return CGSizeMake(width * 0.3, 100.0);
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:ELSegueIdentifierOpenSlotMachine]) {
		ELSlotMachineViewController *slotMachineViewController = segue.destinationViewController;
		NSIndexPath *indexPath = (NSIndexPath *)sender;
		slotMachineViewController.pokemonNumber = indexPath.row + 1;
	}
}
@end
