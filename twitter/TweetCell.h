//
//  TweetCell.h
//  twitter
//
//  Created by Prasanth Guruprasad on 11/8/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

@interface TweetCell : UITableViewCell
//    start adding members
@property (strong, nonatomic) Tweet *tweet;

@end
