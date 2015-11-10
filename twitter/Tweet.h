//
//  Tweet.h
//  twitter
//
//  Created by Prasanth Guruprasad on 11/6/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"

@interface Tweet : NSObject

+ (NSArray *) tweetsWithArray:(NSArray *)dictionaries;

- (id) initWithDictionary: ( NSDictionary *)dictionary;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) NSString *retweetCount;
@property (strong, nonatomic) NSString *favoriteCount;

@end
