//
//  GCMainViewController.m
//  iControl
//
//  Created by DetroitLabsUser on 3/4/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "GCMainViewController.h"

@interface GCMainViewController ()
@property (nonatomic,weak) IBOutlet UILabel *usernameLabel;
@property (nonatomic,weak)IBOutlet UITextField *ageTextField;
@property (nonatomic,weak)IBOutlet UIImageView *profileImageView;
@property (nonatomic, weak)IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, weak)IBOutlet UISegmentedControl *maritalStatusSegmentedControl;
@property (nonatomic,weak)IBOutlet UISwitch *favSwitch;
@property (nonatomic, weak) IBOutlet UIStepper *ageStepper;
@end


@implementation GCMainViewController

-(IBAction)textFieldDidChange:(id)sender{
    NSLog(@"Text Field Did Change");
    if ([_ageStepper minimumValue] <= [_ageTextField.text intValue] &&
        [_ageTextField.text intValue] <= [_ageStepper maximumValue]) {
        [_ageStepper setValue:[_ageTextField.text intValue]];
    }
}

-(IBAction)stepperChanged:(id)sender {
    NSLog(@"Age: %.0f", _ageStepper.value);
    _ageTextField.text = [NSString stringWithFormat:@"%.0f", _ageStepper.value];
}

-(IBAction)favChanged:(id)sender {
    if ([_favSwitch isOn]) {
        NSLog(@"Fav: Yes");
    } else {
        NSLog(@"Fav: No");
    }
}

-(IBAction)maritalStatusChanged:(id)sender {
    NSLog(@"Status Changed to: %@",[_maritalStatusSegmentedControl titleForSegmentAtIndex:[_maritalStatusSegmentedControl selectedSegmentIndex]]);
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:
(NSRange)range replacementString:(NSString *)string {
    
    if(textField == _ageTextField) {
    NSCharacterSet *numberCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
    NSString *filteredString = [[string componentsSeparatedByCharactersInSet:
                                 numberCharSet] componentsJoinedByString:@""];
    return [string isEqualToString:filteredString];
    }
    return YES;
    
}
- (IBAction)swapPressed:(id)sender {
    NSLog(@"Swap");
    if ([_profileImageView image]==[UIImage imageNamed:@"p_kelley_jeff.jpg"]) {
        [_profileImageView setImage:[UIImage imageNamed:@"p_hughes_nathan.jpg"]];
        } else {
            [_profileImageView setImage:[UIImage imageNamed:@"p_kelley_jeff.jpg"]];
        }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_backgroundImageView setImage:[[UIImage imageNamed:@"i_menu_background.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 40.0, 40.0, 0.04)]];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _usernameLabel.text = @"User: Amy Leikert";
    [_usernameLabel setTextColor:[UIColor colorWithRed:255/255. green: 0/255 blue:0/255. alpha:1.0]];
    [_usernameLabel setFont:[UIFont fontWithName:@"Futura" size: 14.0]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(GCFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

@end
