//
//  ViewController.m
//  PIXSlidePresentationController
//
//  Created by Andrea Ottolina on 03/05/2017.
//  Copyright © 2017 Pixelinlove Ltd. All rights reserved.
//

#import "ViewController.h"
#import "PIXSlideTransitionDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) PIXSlideTransitionDelegate *slideTransitionDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SlideSegue"]) {
        UIViewController *destinationViewController = segue.destinationViewController;
        
        PIXSlideTransitionDelegate *transitionDelegate = self.slideTransitionDelegate;
        
        destinationViewController.transitioningDelegate = transitionDelegate;
        destinationViewController.modalPresentationStyle = UIModalPresentationCustom;
    }
}

- (PIXSlideTransitionDelegate *)slideTransitionDelegate {
    if (_slideTransitionDelegate == nil) {
        _slideTransitionDelegate = [[PIXSlideTransitionDelegate alloc] init];
    }
    
    return _slideTransitionDelegate;
}

#pragma mark -
#pragma mark Unwind Actions

- (IBAction)unwindToViewController:(UIStoryboardSegue *)sender {}

@end
