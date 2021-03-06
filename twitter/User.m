//
//  User.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/6/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "User.h"
#import "TwitterClient.h"

NSString * const UserDidLoginNotification = @"UserDidLoginNotification";
NSString * const UserDidLogoutNotification = @"UserDidLogoutNotification";

@interface User()

@property (strong, nonatomic) NSDictionary* jsonUser;

@end

@implementation User

static User *_currentUser = nil;
NSString * const kCurrentUserKey = @"currentUserKey";

- (id) initWithDictionary: ( NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.jsonUser = dictionary;
        self.name = dictionary[@"name"];
        self.screenName = dictionary[@"screen_name"];
        self.profileImageURL = dictionary[@"profile_image_url"];
        self.tagline = dictionary[@"description"];

        self.followersCount = dictionary[@"followers_count"];
        self.followingCount = dictionary[@"friends_count"];
        self.profileBannerURL = dictionary[@"profile_banner_url"];
    }
    return self;
}

-(NSString *) description {
    NSString *desc = [NSString stringWithFormat:@"Name : %@\nscreenName: %@\nprofileImageURL: %@\ntagline: %@", self.name
                      , self.screenName
                        , self.profileImageURL
                      , self.tagline];
    return desc;
}

+ (User *) currentUser {
    if (_currentUser == nil) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:kCurrentUserKey];
        if (data != nil) {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            _currentUser = [[User alloc] initWithDictionary: dictionary];
        }
    }
    return _currentUser;
}

+ (void) setCurrentUser:(User *)currentUser {
    _currentUser = currentUser;
    if (_currentUser != nil) {
        NSData *data = [NSJSONSerialization dataWithJSONObject:_currentUser.jsonUser options:0 error:nil];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:kCurrentUserKey];
    
    } else {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:kCurrentUserKey];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) logout {
    [self setCurrentUser:nil];
    [[TwitterClient sharedInstance].requestSerializer removeAccessToken];
    [[NSNotificationCenter defaultCenter] postNotificationName: UserDidLogoutNotification object:nil];
}

@end
