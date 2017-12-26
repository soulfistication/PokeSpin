//
//  ELScreenDismissable.h
//  ELPokemon
//
//  Created by MacBook Pro on 12/26/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#ifndef ELScreenDismissable_h
#define ELScreenDismissable_h

@protocol ELScreenDismissable<NSObject>
@optional
- (void)screedDidDismissed;
- (void)screenDidDismissedWithUnlockedPokemonIdentifier:(NSInteger)identifier;
@end

#endif /* ELScreenDismissable_h */
