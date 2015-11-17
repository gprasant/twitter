//
//  ProfileViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/16/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "ProfileViewController.h"


@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *userBannerImage;
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersCountLabel;
@property (weak, nonatomic) IBOutlet UITableView *tweetsTable;


@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) setupUI {
    self.nameLabel.text = self.user.name;
    self.screenNameLabel.text = self.user.screenName;
    self.descriptionLabel.text = self.user.tagline;
    self.followersCountLabel.text = self.user.followersCount;
    self.followingCountLabel.text = self.user.followingCount;
    self.locationLabel.text = self.user.location;
}

@end
