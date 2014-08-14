//
//  GCFlipsideViewController.m
//  iControl
//
//  Created by DetroitLabsUser on 3/4/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "GCFlipsideViewController.h"

@interface GCFlipsideViewController ()
@property (nonatomic, weak) IBOutlet UIProgressView *completeProgressView;
@property (nonatomic, weak) IBOutlet UILabel *completeLabel;
@property (nonatomic,weak) IBOutlet UISlider *ratingSlider;
@property (nonatomic, weak) IBOutlet UILabel *ratingLabel;

@end

@implementation GCFlipsideViewController

-(IBAction)ratingChanged:(id)sender {
    NSLog(@"Rating Changed %f", _ratingSlider.value);
    int sliderValue = _ratingSlider.value;
    _ratingLabel.text = [NSString stringWithFormat:@"My Rating: %i", sliderValue];
    [_ratingSlider setValue:sliderValue animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {
    float percentComplete = 0.8;
    [_completeProgressView setProgress:percentComplete animated:YES];
    NSString *completeString = [NSString stringWithFormat:@"Profile %.0f%% complete", percentComplete*100];
    _completeLabel.text = completeString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
