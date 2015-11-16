//
//  MenuViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/15/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "MenuViewController.h"
#import "TweetsViewController.h"
#import "ProfileViewController.h"
#import "MentionsViewController.h"
#import "MenuCell.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *menuItems;
@property (strong, nonatomic) NSArray *contentControllers;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initMenuItems];
    [self initTableView];
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
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    cell.menuLabel.text = self.menuItems[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"Tapped on menu : %@", self.menuItems[indexPath.row]);
    [self.hamburgerController hideCurrentContentController];
    [self.hamburgerController displayContentController: self.contentControllers[indexPath.row]];
    [self.hamburgerController hideMenuView];
}

-(void) initMenuItems {
    self.menuItems = [NSMutableArray arrayWithArray:@[@"Home", @"Profile", @"Mentions"]];
    self.contentControllers = [NSMutableArray arrayWithArray:@[
                                                               [[TweetsViewController alloc] init],
                                                               [[ProfileViewController alloc] init],
                                                               [[MentionsViewController alloc] init]
                                                            ]];
    [self.tableView reloadData];
}

-(void) initTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    UINib *nib = [UINib nibWithNibName:@"MenuCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"MenuCell"];
}

@end
