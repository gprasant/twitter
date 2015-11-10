//
//  LoginViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/4/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "LoginViewController.h"
#import "TweetsViewController.h"
#import "TwitterClient.h"
@interface LoginViewController ()
- (IBAction)onLogin:(id)sender;

@end

@implementation LoginViewController
- (IBAction)onLogin:(id)sender {
    [[TwitterClient sharedInstance] loginWithCompletion: ^(User *user, NSError *error) {
        if (user) {
            // present Tweets View Modally
            NSLog(@"Welcome to : %@", user.name);
            UIViewController *vc = [[TweetsViewController alloc] init];
            UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController: vc];
            [self presentViewController:nvc animated:YES completion:nil];
        } else {
            // present Error View
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
