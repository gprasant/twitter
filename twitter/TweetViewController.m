//
//  TweetViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/10/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TweetViewController.h"

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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onReplyButtonTap:(id)sender {
}

- (IBAction)onRetweetButtonTap:(id)sender {
}

- (IBAction)onFavoriteButtonTap:(id)sender {
}
@end
