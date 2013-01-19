//
//  TweetDetailViewController.h
//  JustinBieberTwitter
//
//  Created by Yipei Guan on 12-01-01.
//  Copyright (c) 2012 University Of Waterloo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetDetailViewController : UIViewController{
    

    NSString *tweetMessageString;
    NSString *tweetUserString;
    
}

@property (retain, nonatomic) IBOutlet UILabel *tweetMessageLabel;
@property (retain, nonatomic) IBOutlet UILabel *tweetUserLabel;
@property (retain, nonatomic) NSString *tweetMessageString;
@property (retain, nonatomic) NSString *tweetUserString;

@end
