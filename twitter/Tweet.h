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

@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) User *user;

- (id) initWithDictionary: ( NSDictionary *)dictionary;

+ (NSArray *) tweetsWithArray:(NSArray *)dictionaries;
@end
