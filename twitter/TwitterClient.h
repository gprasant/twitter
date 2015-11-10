//
//  TwitterClient.h
//  twitter
//
//  Created by Prasanth Guruprasad on 11/4/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"
#import "Tweet.h"
@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *) sharedInstance;

- (void) homeTimelineWithParams: (NSDictionary *)params completion: (void (^)(NSArray *tweets, NSError *error)) completion;
- (void) postStatus: (NSDictionary *)params completion: (void (^)(Tweet *tweet, NSError *error)) completion;
- (void) loginWithCompletion: (void (^)(User *user, NSError *error)) completion;
- (void) openURL: (NSURL *)url;

@end

