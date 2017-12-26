//
//  ELFailedViewController.h
//  ELPokemon
//
//  Created by MacBook Pro on 12/26/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELScreenDismissable.h"

@interface ELFailedViewController : UIViewController
@property (nonatomic, strong) NSString *failedSequence;
@property (nonatomic, weak) id<ELScreenDismissable> delegate;
@end
