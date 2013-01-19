//
//  TweetDetailViewController.m
//  JustinBieberTwitter
//
//  Created by Yipei Guan on 12-01-01.
//  Copyright (c) 2012 University Of Waterloo. All rights reserved.
//

#import "TweetDetailViewController.h"

@implementation TweetDetailViewController
@synthesize messageLabel;
@synthesize userlabel;
@synthesize message;
@synthesize user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    messageLabel.text = self.message;
    userlabel.text = self.user;
    
}


- (void)viewDidUnload
{
    [self setMessageLabel:nil];
    [self setUserlabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
