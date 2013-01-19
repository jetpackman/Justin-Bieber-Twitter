//
//  TweetViewController.h
//  JustinBieberTwitter
//
//  Created by Yipei Guan on 11-12-31.
//  Copyright (c) 2011 University Of Waterloo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetDetailViewController.h"

@interface TweetViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *tweets;
-(BOOL)isElementOf:(NSString*) message:(NSString*) user;
@end
