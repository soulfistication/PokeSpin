//
//  ELFailedViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/26/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELFailedViewController.h"

@interface ELFailedViewController ()

@end

@implementation ELFailedViewController
#pragma mark - UIViewController
- (void)viewDidLoad {
	[super viewDidLoad];
}

#pragma mark - IBAction
- (IBAction)closeButtonTapped:(id)sender {
	[self dismissViewControllerAnimated:YES completion:^{
		if ([self.delegate respondsToSelector:@selector(screedDidDismissed)]) {
			[self.delegate screedDidDismissed];
		}
	}];
}
@end
