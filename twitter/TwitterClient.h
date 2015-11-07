//
//  TwitterClient.h
//  twitter
//
//  Created by Prasanth Guruprasad on 11/4/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"
#import "User.h"
@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *) sharedInstance;
- (void) loginWithCompletion: (void (^)(User *user, NSError *error)) completion;
- (void) openURL: (NSURL *)url;

@end

