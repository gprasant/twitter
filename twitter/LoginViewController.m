//
//  LoginViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/4/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "LoginViewController.h"
#import "TwitterClient.h"
@interface LoginViewController ()
- (IBAction)onLogin:(id)sender;

@end

@implementation LoginViewController
- (IBAction)onLogin:(id)sender {
    [[TwitterClient sharedInstance].requestSerializer removeAccessToken];
    [[TwitterClient sharedInstance] fetchRequestTokenWithPath:@"oauth/request_token"
                                                       method:@"GET"
                                                  callbackURL:[NSURL URLWithString:@"cptwitterdemo://oauth"]
                                                        scope:nil
                                                      success:^(BDBOAuth1Credential *requestToken) {
                                                          NSLog(@"got the request token");
                                                         
                                                          NSURL *authURL = [NSURL URLWithString: [NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token ]];

                                                          [[UIApplication sharedApplication] openURL:authURL];
                                                          
                                                      } failure:^(NSError *error) {
                                                          NSLog(@"failed to get the request token!");
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
@end
