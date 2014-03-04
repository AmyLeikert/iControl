//
//  GCFlipsideViewController.m
//  iControl
//
//  Created by DetroitLabsUser on 3/4/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import "GCFlipsideViewController.h"

@interface GCFlipsideViewController ()

@end

@implementation GCFlipsideViewController

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
