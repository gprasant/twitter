//
//  TweetsViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/7/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "TweetsViewController.h"
#import "User.h"
#import "TwitterClient.h"
#import "Tweet.h"
#import "TweetCell.h"

@interface TweetsViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tweetsTableView;
@property (strong, nonatomic) NSArray *tweets;

@end

@implementation TweetsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(onSignoutTap)];
    self.navigationItem.title = @"Home";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Compose" style:UIBarButtonItemStylePlain target:self action:@selector(onComposeTap)];
    [[TwitterClient sharedInstance] homeTimelineWithParams:nil
                                                completion:^(NSArray *tweets, NSError *error) {
                                                    self.tweets = tweets;
                                                    for (Tweet *t in tweets) {
                                                        NSLog(@"Text : %@", t.text);
                                                    }
                                                }];
    self.tweetsTableView.dataSource = self;
    self.tweetsTableView.delegate = self;
    UINib *tweetCellNib = [UINib nibWithNibName:@"TweetCell" bundle:nil];
    [self.tweetsTableView registerNib:tweetCellNib forCellReuseIdentifier:@"TweetCell"];
    
    self.tweetsTableView.estimatedRowHeight = 100;
    self.tweetsTableView.rowHeight = UITableViewAutomaticDimension;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tweetsTableView dequeueReusableCellWithIdentifier:@"TweetCell"];
    return cell;
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

#pragma mark - Private methods
- (void) onSignoutTap {
    [self onLogout: self.navigationItem.leftBarButtonItem];
}

- (void) onComposeTap {
    //Launch Compose view here;
}

@end
