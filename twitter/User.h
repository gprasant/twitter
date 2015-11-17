//
//  User.h
//  twitter
//
//  Created by Prasanth Guruprasad on 11/6/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

extern NSString * const UserDidLoginNotification;
extern NSString * const UserDidLogoutNotification;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *screenName;
@property (strong, nonatomic) NSString *profileImageURL;
@property (strong, nonatomic) NSString *profileBannerURL;
@property (strong, nonatomic) NSString *tagline;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *followersCount;
@property (strong, nonatomic) NSString *followingCount;

- (id) initWithDictionary: ( NSDictionary *)dictionary;
+ (User *) currentUser;
+ (void) setCurrentUser:(User *)currentUser;

+ (void) logout;

@end
