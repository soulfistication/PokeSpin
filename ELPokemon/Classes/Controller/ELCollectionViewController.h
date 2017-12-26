//
//  ELCollectionViewController.h
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELViewController.h"
#import "ELScreenDismissable.h"

@interface ELCollectionViewController : ELViewController<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, ELScreenDismissable>

@end
