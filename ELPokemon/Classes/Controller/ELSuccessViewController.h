//
//  ELSuccessViewController.h
//  ELPokemon
//
//  Created by MacBook Pro on 12/26/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELScreenDismissable.h"

@interface ELSuccessViewController : UIViewController
@property (nonatomic, assign) NSInteger pokemonIdentifier;
@property (nonatomic, weak) id<ELScreenDismissable> delegate;
@end
