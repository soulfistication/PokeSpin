//
//  ELCollectionViewCell.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELCollectionViewCell.h"

@implementation ELCollectionViewCell

#pragma mark - UICollectionViewCell

- (void)prepareForDisplayWithLabelText:(NSString *)labelText image:(NSString *)imageName {
	[self setupUI];
	// If the controller sends an image name then we display it. View doesn't know
	// if pokemon is unlocked or not.
	if (imageName) {
		self.cellImageView.image = [UIImage imageNamed:imageName];
		self.cellLabel.text = nil;
	} else {
		self.cellLabel.text = labelText;
		self.cellImageView.image = nil;
	}
}

#pragma mark - Setup UI
- (void)setupUI {
	self.contentView.backgroundColor = [UIColor colorWithRed:222.0/255.0 green:241.0/255.0 blue:252/255.0 alpha:1.0];
	self.contentView.layer.cornerRadius = 5.0;
}
@end
