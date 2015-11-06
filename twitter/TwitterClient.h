//
//  TwitterClient.h
//  twitter
//
//  Created by Prasanth Guruprasad on 11/4/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "BDBOAuth1RequestOperationManager.h"

@interface TwitterClient : BDBOAuth1RequestOperationManager

+ (TwitterClient *) sharedInstance;

@end
