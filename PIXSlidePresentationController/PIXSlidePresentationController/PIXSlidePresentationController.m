//
//  PIXSlidePresentationController.m
//  PIXSlidePresentationController
//
//  Created by Andrea Ottolina on 03/05/2017.
//  Copyright © 2017 Pixelinlove Ltd. All rights reserved.
//

#import "PIXSlidePresentationController.h"

//! Settings for presentation UI
#define PRESENTED_VIEW_SHADOW_OPACITY   0.44f
#define PRESENTED_VIEW_SHADOW_RADIUS    13.f
#define PRESENTED_VIEW_SHADOW_OFFSET    6.f
#define DIMMING_VIEW_ALPHA              .4f

@interface PIXSlidePresentationController ()

@property (nonatomic, strong) UIView *dimmingView;

@end

@implementation PIXSlidePresentationController

- (void)presentationTransitionWillBegin {
    
    UIView *containerView = self.containerView;
    UIViewController *presentedViewController = self.presentedViewController;
    UIView *presentedView = self.presentedView;
    
    // Add shadow
    presentedView.layer.shadowOpacity = PRESENTED_VIEW_SHADOW_OPACITY;
    presentedView.layer.shadowRadius = PRESENTED_VIEW_SHADOW_RADIUS;
    presentedView.layer.shadowOffset = CGSizeMake(PRESENTED_VIEW_SHADOW_OFFSET, 0);
    
    UIView *dimmingView = [[UIView alloc] initWithFrame:containerView.bounds];
    self.dimmingView = dimmingView;
    
    dimmingView.backgroundColor = [UIColor blackColor];
    dimmingView.opaque = NO;
    dimmingView.alpha = 0.f;
    
    [dimmingView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dimmingViewTapped:)]];
    
    [containerView insertSubview:dimmingView atIndex:0];
    
    [[presentedViewController transitionCoordinator] animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        dimmingView.alpha = DIMMING_VIEW_ALPHA;
    } completion:nil];
}

- (void)presentationTransitionDidEnd:(BOOL)completed {
    if (completed == NO) {
        self.dimmingView = nil;
    }
}

- (void)dismissalTransitionWillBegin {
    id<UIViewControllerTransitionCoordinator> transitionCoordinator = self.presentingViewController.transitionCoordinator;
    
    [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        self.dimmingView.alpha = 0.f;
    } completion:nil];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed {
    if (completed == YES) {
        self.dimmingView = nil;
    }
}

- (void)containerViewWillLayoutSubviews {
    [super containerViewWillLayoutSubviews];
    
    self.dimmingView.frame = self.containerView.bounds;
}

#pragma mark -
#pragma mark Tap Gesture Recognizer

//| ----------------------------------------------------------------------------
//  IBAction for the tap gesture recognizer added to the dimmingView.
//  Dismisses the presented view controller.
//
- (IBAction)dimmingViewTapped:(UITapGestureRecognizer*)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

@end
