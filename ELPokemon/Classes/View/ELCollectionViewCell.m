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

- (void)prepareForDisplayWithLabelText:(NSString *)labelText image:(NSString *)image {
	[self setupUI];
	self.cellLabel.text = labelText;
	self.cellImageView.image = [UIImage imageNamed:image];
}

#pragma mark - Setup UI

- (void)setupUI {
	self.contentView.backgroundColor = [UIColor magentaColor];
	self.contentView.layer.cornerRadius = 5.0;
}
@end
