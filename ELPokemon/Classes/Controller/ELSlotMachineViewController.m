//
//  ELSlotMachineViewController.m
//  ELPokemon
//
//  Created by MacBook Pro on 12/25/17.
//  Copyright © 2017 Ivan. All rights reserved.
//

#import "ELSlotMachineViewController.h"

@interface ELSlotMachineViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *slotMachinePickerView;
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
- (IBAction)spinSlotMachine:(id)sender {
	[self.slotMachinePickerView selectRow:arc4random() % 12 + 12 inComponent:0 animated:YES];
	
	[self.slotMachinePickerView selectRow:arc4random() % 12 + 12 inComponent:1 animated:YES];
	
	[self.slotMachinePickerView selectRow:arc4random() % 12 + 12 inComponent:2 animated:YES];
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

@end
