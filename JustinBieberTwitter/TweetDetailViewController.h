//
//  TweetDetailViewController.h
//  JustinBieberTwitter
//
//  Created by Yipei Guan on 12-01-01.
//  Copyright (c) 2012 University Of Waterloo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetDetailViewController : UIViewController

@property (nonatomic, retain)NSString *message, *user;
@property (nonatomic, retain) IBOutlet UILabel *messageLabel;
@property (nonatomic, retain) IBOutlet UILabel *userlabel;

@end
