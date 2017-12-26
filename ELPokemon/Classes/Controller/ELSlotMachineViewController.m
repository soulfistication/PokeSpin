//
//  ELSlotMachineViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <libextobjc/extobjc.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import "ELSlotMachineViewController.h"
#import "ELSuccessViewController.h"

@interface ELSlotMachineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pokemonNumberLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *slotMachinePickerView;
@property (weak, nonatomic) IBOutlet UILabel *wonLabel;
@property (weak, nonatomic) IBOutlet UIImageView *wonImageView;
@property (weak, nonatomic) IBOutlet UIButton *spinSlotButton;
@end

@implementation ELSlotMachineViewController
#pragma mark - UIViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	
	[self setupUI];
}

#pragma mark - Setup UI
- (void)setupUI {
	// Setup title
	self.pokemonNumberLabel.text = [NSString stringWithFormat:@"%ld", self.pokemonNumber];
	
	// Setup initial Picker UI
	[self.slotMachinePickerView selectRow:4 inComponent:0 animated:YES];

	[self.slotMachinePickerView selectRow:4 inComponent:1 animated:YES];

	[self.slotMachinePickerView selectRow:4 inComponent:2 animated:YES];
}
#pragma mark - IBActions
- (IBAction)closeButtonTapped:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)spinSlotMachine:(id)sender {
	self.spinSlotButton.enabled = NO;
	// Modulo 12 because we have 4 symbols * 3 times to show one full screen of
	// Picker View content. In the end one screen was not enough to make the spin
	// effect look continuous so I multiplied 12 * 3 = 36 to get 3 screens worth
	// of spin and make it seem infinite.
	// The + 12 is because we don't want to fall back to the first screen. It looks
	// awkard from the top. You can remove it and experiment.
	NSInteger firstComponentRandomNumber = arc4random() % 12 + 12;
	NSInteger secondComponentRandomNumber = arc4random() % 12 + 12;
	NSInteger thirdComponentRandomNumber = arc4random() % 12 + 12;
	
	[self.slotMachinePickerView selectRow:firstComponentRandomNumber inComponent:0 animated:YES];
	
	[self.slotMachinePickerView selectRow:secondComponentRandomNumber inComponent:1 animated:YES];
	
	[self.slotMachinePickerView selectRow:thirdComponentRandomNumber inComponent:2 animated:YES];
	
	NSString *firstSymbol = [self slotSymbolForRow:firstComponentRandomNumber];
	NSString *secondSymbol = [self slotSymbolForRow:secondComponentRandomNumber];
	NSString *thirdSymbol = [self slotSymbolForRow:thirdComponentRandomNumber];
	
	BOOL firstHit = [firstSymbol isEqualToString:secondSymbol];
	
	BOOL secondHit = [secondSymbol isEqualToString:thirdSymbol];
	
	BOOL thirdHit = [firstSymbol isEqualToString:thirdSymbol];
	
	BOOL successHit = firstHit &&
	secondHit;
	
	@weakify(self)
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		@strongify(self)
		if (successHit) {
			self.wonLabel.hidden = NO;
			self.wonImageView.hidden = NO;
			@weakify(self)
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				@strongify(self)
				[self performSegueWithIdentifier:ELSegueIdentifierOpenSuccessSlotMachine sender:nil];
			});
			
		} else {
			NSString *message = @"You lost! Please try again.";
			if (firstHit || secondHit || thirdHit) {
				message = @"You almost won! Please try again";
			}
			[SVProgressHUD showInfoWithStatus:message];
			@weakify(self)
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				@strongify(self)
				[SVProgressHUD dismiss];
				[self dismissViewControllerAnimated:YES completion:nil];
			});
		}
	});
}

#pragma mark - UIPickerView Data Source
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 3; // 3 column slot machine add more to make it harder!
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return 36; // 3 screens of 12 = 4 * 3 characters. Enough to make it look infinitely spinning.
}

#pragma mark - UIPickerView Delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [self slotSymbolForRow:row];
}

#pragma mark - Helpers
- (NSString *)slotSymbolForRow:(NSInteger)row {
	if (row % 4 == 0) { // We have 4 different symbols hence modulo 4.
		return @"♠️";
	} else if (row % 4 == 1) {
		return @"♥️";
	} else if (row % 4 == 2) {
		return @"♣️";
	} else if (row % 4 == 3) {
		return @"♦️";
	}
	return @"💊";
}

#pragma mark - ELScreenDismissable
- (void)screedDidDismissed {
	[self closeButtonTapped:nil];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:ELSegueIdentifierOpenSuccessSlotMachine]) {
		ELSuccessViewController *successViewController = segue.destinationViewController;
		successViewController.pokemonIdentifier = self.pokemonNumber;
		successViewController.delegate = self;
	}
}
@end
