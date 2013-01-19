//
//  TweetViewController.m
//  JustinBieberTwitter
//
//  Created by Yipei Guan on 11-12-31.
//  Copyright (c) 2011 University Of Waterloo. All rights reserved.
//

#import <Twitter/Twitter.h>
#import "TweetViewController.h"
#import "Tweet.h"
#import "TweetDetailViewController.h"

@implementation TweetViewController
@synthesize tweets;

- (id) initWithStyle:(UITableViewStyle)style
{
    
    self = [super initWithStyle:style];
    if (self){
    }
    
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tweets = [NSMutableArray arrayWithCapacity:25];
    
    // Get the Tweets of Justin Beiber by way of Twitter API
    TWRequest* request = [[TWRequest alloc] initWithURL:
                          [NSURL URLWithString:@"http://search.twitter.com/search.json?q=justin%20beiber"] parameters:nil requestMethod:TWRequestMethodGET];
    
    
    self.tweets = [NSMutableArray arrayWithCapacity:25];
    [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
        NSArray* firstParse = [dictionary objectForKey:@"results"];
        
        for (NSDictionary *post in firstParse)
        {               
            NSLog (@"%@", post);
            Tweet *tweetMessage = [[Tweet alloc] init];
            NSString* mes = [post objectForKey:@"text"];
            NSString* tweeter = [post objectForKey:@"from_user"];
            
            tweetMessage.message =  [post objectForKey:@"text"];
            tweetMessage.user =  [post objectForKey:@"from_user"];
            
            if ([self isElementOf:mes:tweeter] == NO)
            {
                [self.tweets addObject:tweetMessage];

            }
                
            
            
            
                        
        }
        [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
    }];
}

// Checks if the tweet is already in the system. 
-(BOOL)isElementOf:(NSString*) message:(NSString*) user{

    for (int i = 0; i < [self.tweets count]; i++)
    {
        Tweet* tweet = [self.tweets objectAtIndex:i];
        if ([message isEqualToString:tweet.message] &&
            [user isEqualToString:tweet.user]){
            
            return YES;
        }
    }
    
    
    return NO;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
   
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.tweets count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView 
                             dequeueReusableCellWithIdentifier:@"TweetCell"];
	
    Tweet *tweet = [self.tweets objectAtIndex:indexPath.row];
	cell.textLabel.text = tweet.message;
	cell.detailTextLabel.text = tweet.user;
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		[self.tweets removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}   
}

// For selecting the row
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //NSLog (@"%d", indexPath.row);
    // Create the detail Controller and pass the details of the tweet to it.
    TweetDetailViewController* tweetDetails = [self.storyboard instantiateViewControllerWithIdentifier:@"TweetDetail"];
    
    
    Tweet *tweet = [self.tweets objectAtIndex:indexPath.row];
    
    
    tweetDetails.message = tweet.message;
    tweetDetails.user = tweet.user;
    
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:tweetDetails animated:YES];
     
}


@end
