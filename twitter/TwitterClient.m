//
//  TwitterClient.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/4/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TwitterClient.h"
#import "Tweet.h"
NSString * const kTwitterConsumerKey    = @"D2oXFNPIFGwbG1O1g80yyI0B5";
NSString * const kTwitterConsumerSecret = @"D5oODVdydN1NWwXXCJ6QEx4wBS7zcYJNfLUm3KWeEONWf6H4Qg";
NSString * const kTwitterBaseUrl  =       @"https://api.twitter.com";

@interface TwitterClient ()

@property (nonatomic, strong) void (^loginCompletion)(User *user, NSError *error);

@end

@implementation TwitterClient

+ (TwitterClient *) sharedInstance {
    static TwitterClient *instance = nil;
    
    static dispatch_once_t onceToken;
    NSURL *baseURL = [NSURL URLWithString:kTwitterBaseUrl];
    dispatch_once(&onceToken, ^{
        if (instance == nil) {
            instance = [[TwitterClient alloc] initWithBaseURL:baseURL
                                                  consumerKey:kTwitterConsumerKey
                                               consumerSecret:kTwitterConsumerSecret];
        }
    });
    return instance;
}

- (void) loginWithCompletion: (void (^)(User *user, NSError *error)) completion {
    self.loginCompletion = completion;
    [self.requestSerializer removeAccessToken];
    [self fetchRequestTokenWithPath:@"oauth/request_token"
                             method:@"GET"
                        callbackURL:[NSURL URLWithString:@"cptwitterdemo://oauth"]
                              scope:nil
                            success:^(BDBOAuth1Credential *requestToken) {
                                NSLog(@"got the request token");
                                
                                NSURL *authURL = [NSURL URLWithString: [NSString stringWithFormat:@"https://api.twitter.com/oauth/authorize?oauth_token=%@", requestToken.token ]];
                                
                                [[UIApplication sharedApplication] openURL:authURL];
                                
                            } failure:^(NSError *error) {
                                NSLog(@"failed to get the request token!");
                                self.loginCompletion(nil, error);
                            }];
}

- (void) openURL:(NSURL *)url {
    [self fetchAccessTokenWithPath:@"oauth/access_token"
                            method:@"GET"
                      requestToken:[BDBOAuth1Credential credentialWithQueryString:url.query]
                           success: ^(BDBOAuth1Credential *credential) {
                               NSLog(@"Successfully got access token");
                               [[[TwitterClient sharedInstance] requestSerializer] saveAccessToken:credential];
                               
                               [[TwitterClient sharedInstance] GET:@"1.1/account/verify_credentials.json"
                                                        parameters: nil
                                                           success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                                               User *user = [[User alloc] initWithDictionary:responseObject];
                                                               [User setCurrentUser: user];
                                                               self.loginCompletion(user, nil);
                                                           } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                                               NSLog(@"failed to get response");
                                                               self.loginCompletion(nil, error);
                                                           }];
                               
                           } failure: ^(NSError *error) {
                               NSLog(@"Failed to get the access token");
                               self.loginCompletion(nil, error);
                           }];
    
}

- (void) homeTimelineWithParams: (NSDictionary *)params completion: (void (^)(NSArray *tweets, NSError *error)) completion {
    [[TwitterClient sharedInstance] GET:@"1.1/statuses/home_timeline.json"
                             parameters:params
                                success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                                    NSArray *tweets = [Tweet tweetsWithArray:responseObject];
                                    completion(tweets, nil);
                                }
                                failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                    completion(nil, error);
                                }];
}

@end
