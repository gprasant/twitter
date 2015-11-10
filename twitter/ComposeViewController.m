//
//  ComposeViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/9/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "ComposeViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TwitterClient.h"

@interface ComposeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImageURL;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextField;
@property (weak, nonatomic) IBOutlet UILabel *tweetCharCountLabel;

@end

@implementation ComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Compose";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onTweetTap)];
    self.tweetTextField.text = @"";
    [self.tweetTextField becomeFirstResponder];

    NSURL *imageURL = [NSURL URLWithString:self.user.profileImageURL];
    [self.userProfileImageURL setImageWithURL:imageURL];
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

- (void) onTweetTap {
    NSString *text = self.tweetTextField.text;
    NSMutableDictionary *d = [NSMutableDictionary dictionaryWithObject:text forKey:@"status"];
    [[TwitterClient sharedInstance] postStatus:d completion:^(Tweet *tweet, NSError *error) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    NSLog(@"Post tweet");
}

@end