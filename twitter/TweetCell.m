//
//  TweetCell.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/8/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TweetCell.h"
#import "UIImageView+AFNetworking.h"

@interface TweetCell ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageURL;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userScreenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetTextLabel;

- (IBAction)onReplyButtonTap:(id)sender;
- (IBAction)onRetweetButtonTap:(id)sender;
- (IBAction)onHeartButtonTap:(id)sender;


@end

@implementation TweetCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)onReplyButtonTap:(id)sender {
    NSLog(@"Reply to tweet");
}

- (IBAction)onRetweetButtonTap:(id)sender {
    NSLog(@"Retweet tweet");
}

- (IBAction)onHeartButtonTap:(id)sender {
    NSLog(@"Heart Tweet");
}

- (void) setTweet:(Tweet *)tweet {
    _tweet = tweet;
    NSURL *imageUrl = [NSURL URLWithString:_tweet.user.profileImageURL];
    [self.profileImageURL setImageWithURL: imageUrl];
}
@end
