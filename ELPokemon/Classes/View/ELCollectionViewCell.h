//
//  ELCollectionViewCell.h
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UILabel *cellLabel;
@property (nonatomic, strong) IBOutlet UIImageView *cellImageView;

- (void)prepareForDisplayWithLabelText:(NSString *)labelText image:(NSString *)imageName;
@end
