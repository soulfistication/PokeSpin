//
//  ELPokemon.h
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ELPokemon : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSNumber *identifier;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *baseExperience;
@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, assign) BOOL isDefault;
@property (nonatomic, copy) NSNumber *order;
@property (nonatomic, copy) NSNumber *weight;
@end
