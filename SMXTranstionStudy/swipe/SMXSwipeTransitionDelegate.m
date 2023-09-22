//
//  SMXSwipeTransitionDelegate.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/17.
//

#import "SMXSwipeTransitionDelegate.h"
#import "SMXSwipeTransitionAnimator.h"
#import "SMXSwipeInteractiveTransitionAnimator.h"

@implementation SMXSwipeTransitionDelegate

- (instancetype) initWithRecognizer:(UIScreenEdgePanGestureRecognizer *)recognizer {
    self = [super init];
    if (self) {
        self.recognizer = recognizer;
    }
    return self;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[SMXSwipeTransitionAnimator alloc] init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [[SMXSwipeTransitionAnimator alloc] init];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator {
    return [[SMXSwipeInteractiveTransitionAnimator alloc] initWithRecognizer:self.recognizer];
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return [[SMXSwipeInteractiveTransitionAnimator alloc] initWithRecognizer:self.recognizer];
}

@end
