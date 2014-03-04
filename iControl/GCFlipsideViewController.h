//
//  GCFlipsideViewController.h
//  iControl
//
//  Created by DetroitLabsUser on 3/4/14.
//  Copyright (c) 2014 DetroitLabsUser. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GCFlipsideViewController;

@protocol GCFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(GCFlipsideViewController *)controller;
@end

@interface GCFlipsideViewController : UIViewController

@property (weak, nonatomic) id <GCFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
