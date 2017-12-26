//
//  ELCollectionViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELCollectionViewController.h"
#import "ELCollectionViewCell.h"

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
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(triggerSlotSegue:)];
}

#pragma mark - Target / Action
- (void)triggerSlotSegue:(id)sender {
	[self performSegueWithIdentifier:ELSegueIdentifierOpenSlotMachine sender:sender];
}

#pragma mark - UICollectionView Data Source
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 18;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	ELCollectionViewCell *cell = (ELCollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:ELCellIdentifierPokemonCollectionViewCell forIndexPath:indexPath];
	
	[cell prepareForDisplayWithLabelText:[NSString stringWithFormat:@"%ld", indexPath.row] image:@"pokemonImage"];
	
	return cell;
}
#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"%ld", indexPath.row);
}

#pragma mark - UICollectionvView Delegate Flow Layout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	CGFloat width = self.collectionView.frame.size.width;
	return CGSizeMake(width * 0.3, 100.0);
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:ELSegueIdentifierOpenSlotMachine]) {
		
	}
}
@end
