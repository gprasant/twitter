//
//  TweetsViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/7/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TweetsViewController.h"
#import "TweetViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "Tweet.h"
#import "TweetCell.h"
#import "ComposeViewController.h"

@interface TweetsViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tweetsTableView;
@property (strong, nonatomic) NSArray *tweets;
@property (strong, nonatomic) UIRefreshControl *refreshControl;

@end

@implementation TweetsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop
                                                                                          target:self
                                                                                          action:@selector(onSignoutTap)];
    self.navigationItem.title = @"Home";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
                                                                                           target:self
                                                                                           action:@selector(onComposeTap)];
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshTweets) forControlEvents:UIControlEventValueChanged];
    [self.tweetsTableView insertSubview:self.refreshControl atIndex:0];
    
    [self refreshTweets];
    
    self.tweetsTableView.dataSource = self;
    self.tweetsTableView.delegate = self;
    UINib *tweetCellNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tweetsTableView registerNib:tweetCellNib forCellReuseIdentifier:@"TweetCell"];
    
    self.tweetsTableView.estimatedRowHeight = 100;
    self.tweetsTableView.rowHeight = UITableViewAutomaticDimension;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweets.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TweetCell *cell = [self.tweetsTableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    cell.tweet = self.tweets[indexPath.row];
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tweetsTableView deselectRowAtIndexPath:indexPath animated:YES];
    TweetViewController *vc = [[TweetViewController alloc] initWithNibName:@"TweetViewController" bundle:nil];
    vc.tweet = self.tweets[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogout:(id)sender {
    [User logout];
}

#pragma mark - Private methods
- (void) onSignoutTap {
    [self onLogout: self.navigationItem.leftBarButtonItem];
}

- (void) onComposeTap {
    //Launch Compose view here;
    ComposeViewController *vc = [[ComposeViewController alloc] initWithNibName:@"ComposeViewController" bundle:nil];
    vc.user = [User currentUser];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) refreshTweets {
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                   [NSNumber numberWithInt:50], @"count", nil];
    [[TwitterClient sharedInstance] homeTimelineWithParams:params
                                                completion:^(NSArray *tweets, NSError *error) {
                                                    self.tweets = tweets;
                                                    [self.tweetsTableView reloadData];
                                                    [self.refreshControl endRefreshing];
                                                }];
}

@end
