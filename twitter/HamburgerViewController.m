//
//  HamburgerViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/15/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "HamburgerViewController.h"
#import "MenuViewController.h"
#import "TweetsViewController.h"

@interface HamburgerViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginConstraint;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@property (strong, nonatomic) MenuViewController *menuController;
@property (strong, nonatomic) UIViewController *contentController;



@end

@implementation HamburgerViewController

CGFloat originalLeftMargin;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupMenuController];
    [self setupContentController];
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
- (IBAction)onContentViewPanned:(UIPanGestureRecognizer *)sender {
    CGPoint translation = [sender translationInView:self.view];
    CGPoint velocity = [sender velocityInView:self.view];
    
    if(sender.state == UIGestureRecognizerStateBegan) {
        originalLeftMargin = self.leftMarginConstraint.constant;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        self.leftMarginConstraint.constant = originalLeftMargin + translation.x;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.5 animations:^{
            if (velocity.x > 0) {
                // open
                [self showMenuView];
            } else {
                // close
                [self hideMenuView];
            }
            [self.view layoutIfNeeded];
        }];
    }
}

- (void) hideMenuView {
    [UIView animateWithDuration:2 animations:^{
        self.leftMarginConstraint.constant = 0;
    }];
}

#pragma mark - Private methods

- (void) showMenuView {
    self.leftMarginConstraint.constant = self.view.frame.size.width - 50;
}

-(void) setupMenuController {
    self.menuController = [[MenuViewController alloc] init];
}

- (void) setupContentController {
    UIViewController *tweetsVC = [[TweetsViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:tweetsVC];
    [self hideCurrentContentController];
    [self displayContentController:nvc];
}

-(void) setMenuController:(MenuViewController *)vc {
    _menuController = vc;
    _menuController.hamburgerController = self;
    [self.menuView addSubview: vc.view];
}

-(void) displayContentController:(UIViewController *)content {
    [self addChildViewController:content];
    content.view.frame = self.view.frame;
    
    [self.contentView addSubview: content.view];
    [content didMoveToParentViewController:self];
    self.contentController = content;
}

-(void) hideCurrentContentController {
    UIViewController *content = self.contentController;
    [content willMoveToParentViewController: nil];
    [content.view removeFromSuperview];
    [content removeFromParentViewController];
}
@end
