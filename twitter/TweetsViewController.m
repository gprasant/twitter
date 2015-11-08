//
//  TweetsViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/7/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TweetsViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "Tweet.h"

@interface TweetsViewController ()
- (IBAction)onLogout:(id)sender;

@end

@implementation TweetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(onSignoutTap)];
    [[TwitterClient sharedInstance] homeTimelineWithParams:nil
                                                completion:^(NSArray *tweets, NSError *error) {
                                                    for (Tweet *t in tweets) {
                                                        NSLog(@"Text : %@", t.text);
                                                    }
                                                }];
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

- (IBAction)onLogout:(id)sender {
    [User logout];
}

#pragma mark - Private methods
- (void) onSignoutTap {
    [self onLogout: self.navigationItem.leftBarButtonItem];
}

@end
