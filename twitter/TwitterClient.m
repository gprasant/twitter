//
//  TwitterClient.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/4/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TwitterClient.h"

NSString * const kTwitterConsumerKey    = @"D2oXFNPIFGwbG1O1g80yyI0B5";
NSString * const kTwitterConsumerSecret = @"D5oODVdydN1NWwXXCJ6QEx4wBS7zcYJNfLUm3KWeEONWf6H4Qg";
NSString * const kTwitterBaseUrl  =       @"https://api.twitter.com";

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

@end
