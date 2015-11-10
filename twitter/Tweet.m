//
//  Tweet.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/6/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (id) initWithDictionary: ( NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.text = dictionary[@"text"];
        self.user =  [[User alloc ] initWithDictionary: dictionary[@"user"]];
        
        NSString *createdAtString = dictionary[@"created_at"];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"EEE MMM d HH:mm:ss Z y";
        self.createdAt = [formatter dateFromString:createdAtString];
        self.retweetCount = [NSString stringWithFormat:@"%@", dictionary[@"retweet_count"]] ;
        self.favoriteCount = [NSString stringWithFormat:@"%@", dictionary[@"favorite_count"]];
    }
    return self;
}

+ (NSArray *)tweetsWithArray:(NSArray *)dictionaries {
    NSMutableArray *tweets = [NSMutableArray array];
    
    for (NSDictionary *d in dictionaries) {
        Tweet *t = [[Tweet alloc]initWithDictionary:d];
        [tweets addObject:t];
    }
    return tweets;
}

@end
