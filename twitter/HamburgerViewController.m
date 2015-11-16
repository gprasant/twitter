//
//  HamburgerViewController.m
//  twitter
//
//  Created by Prasanth Guruprasad on 11/15/15.
//  Copyright © 2015 codepath. All rights reserved.
//

#import "HamburgerViewController.h"

@interface HamburgerViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMarginConstraint;

@end

@implementation HamburgerViewController

CGFloat originalLeftMargin;

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


#pragma mark - Private methods

- (void) showMenuView {
    self.leftMarginConstraint.constant = self.view.frame.size.width - 50;
}

- (void) hideMenuView {
    self.leftMarginConstraint.constant = 0;
}

@end
