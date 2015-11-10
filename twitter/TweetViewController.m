//
//  TweetViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/10/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TweetViewController.h"
#import "UIImageView+AFNetworking.h"

@interface TweetViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImgURL;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userScreenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoritesCountLabel;

- (IBAction)onReplyButtonTap:(id)sender;
- (IBAction)onRetweetButtonTap:(id)sender;
- (IBAction)onFavoriteButtonTap:(id)sender;

@end

@implementation TweetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.userNameLabel.text = _tweet.user.name;
    User *user = _tweet.user;
    self.userNameLabel.text = user.name;
    self.userScreenNameLabel.text = user.screenName;
    [self.userProfileImgURL setImageWithURL:[NSURL URLWithString:user.profileImageURL]];
    self.tweetTextLabel.text = _tweet.text;
    self.retweetCountLabel.text = _tweet.retweetCount;
    self.favoritesCountLabel.text = _tweet.favoriteCount;
    
    self.createdAtLabel.text = [NSDateFormatter localizedStringFromDate:_tweet.createdAt
                                                              dateStyle:NSDateFormatterShortStyle
                                                              timeStyle:NSDateFormatterShortStyle ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setTweet:(Tweet *) tweet {
    _tweet = tweet;
}

- (IBAction)onReplyButtonTap:(id)sender {
}

- (IBAction)onRetweetButtonTap:(id)sender {
}

- (IBAction)onFavoriteButtonTap:(id)sender {
}
@end
