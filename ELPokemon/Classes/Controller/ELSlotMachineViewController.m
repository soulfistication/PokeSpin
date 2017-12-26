//
//  ELSlotMachineViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import <libextobjc/extobjc.h>
#import "ELSlotMachineViewController.h"
#import "ELSuccessViewController.h"
#import "ELFailedViewController.h"

@interface ELSlotMachineViewController ()
@property (nonatomic, strong) NSString *slotSequence;
@property (weak, nonatomic) IBOutlet UIPickerView *slotMachinePickerView;
@property (weak, nonatomic) IBOutlet UIButton *spinSlotButton;
@end

@implementation ELSlotMachineViewController
#pragma mark - UIViewController
- (void)viewDidLoad {
	[super viewDidLoad];
	
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

	NSInteger firstComponentRandomNumber = arc4random() % 12 + 12;
	NSInteger secondComponentRandomNumber = arc4random() % 12 + 12;
	NSInteger thirdComponentRandomNumber = arc4random() % 12 + 12;
	
	[self.slotMachinePickerView selectRow:firstComponentRandomNumber inComponent:0 animated:YES];
	
	[self.slotMachinePickerView selectRow:secondComponentRandomNumber inComponent:1 animated:YES];
	
	[self.slotMachinePickerView selectRow:thirdComponentRandomNumber inComponent:2 animated:YES];
	
	NSString *firstSymbol = [self slotSymbolForRow:firstComponentRandomNumber];
	NSString *secondSymbol = [self slotSymbolForRow:secondComponentRandomNumber];
	NSString *thirdSymbol = [self slotSymbolForRow:thirdComponentRandomNumber];
	
	self.slotSequence = [[firstSymbol stringByAppendingString:secondSymbol] stringByAppendingString:thirdSymbol];
	
	BOOL successHit = [firstSymbol isEqualToString:secondSymbol] &&
	[secondSymbol isEqualToString:thirdSymbol];
	
	@weakify(self)
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		@strongify(self)
		if (successHit) {
			[self performSegueWithIdentifier:ELSegueIdentifierOpenSuccessSlotMachine sender:nil];
		} else {
			[self performSegueWithIdentifier:ELSegueIdentifierOpenFailedSlodMachine sender:nil];
		}
	});

}

#pragma mark - UIPickerView Data Source
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 3;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return 36;
}

#pragma mark - UIPickerView Delegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [self slotSymbolForRow:row];
}

#pragma mark - Helpers
- (NSString *)slotSymbolForRow:(NSInteger)row {
	if (row % 4 == 0) {
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
		successViewController.successfullSequence = self.slotSequence;
		successViewController.delegate = self;
	} else if ([segue.identifier isEqualToString:ELSegueIdentifierOpenFailedSlodMachine]) {
		ELFailedViewController *failedViewController = segue.destinationViewController;
		failedViewController.failedSequence = self.slotSequence;
		failedViewController.delegate = self;
	}
}
@end
