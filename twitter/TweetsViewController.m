//
//  TweetsViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/7/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TweetsViewController.h"
#import "User.h"

@interface TweetsViewController ()
- (IBAction)onLogout:(id)sender;

@end

@implementation TweetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)onLogout:(id)sender {
    [User logout];
}
@end
