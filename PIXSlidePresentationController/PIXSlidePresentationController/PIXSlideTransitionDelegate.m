//
//  PIXSlideTransitionDelegate.m
//  PIXSlidePresentationController
//
//  Created by Andrea Ottolina on 03/05/2017.
//  Copyright © 2017 Pixelinlove Ltd. All rights reserved.
//

#import "PIXSlideTransitionDelegate.h"
#import "PIXSlideTransitionAnimator.h"
#import "PIXSlidePresentationController.h"

@implementation PIXSlideTransitionDelegate

- (UIPresentationController*)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[PIXSlidePresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

//| ----------------------------------------------------------------------------
//  The system calls this method on the presented view controller's
//  transitioningDelegate to retrieve the animator object used for animating
//  the presentation of the incoming view controller.  Your implementation is
//  expected to return an object that conforms to the
//  UIViewControllerAnimatedTransitioning protocol, or nil if the default
//  presentation animation should be used.
//
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [PIXSlideTransitionAnimator new];
}


//| ----------------------------------------------------------------------------
//  The system calls this method on the presented view controller's
//  transitioningDelegate to retrieve the animator object used for animating
//  the dismissal of the presented view controller.  Your implementation is
//  expected to return an object that conforms to the
//  UIViewControllerAnimatedTransitioning protocol, or nil if the default
//  dismissal animation should be used.
//
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [PIXSlideTransitionAnimator new];
}


@end
