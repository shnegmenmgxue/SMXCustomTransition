//
//  SMXSwipeInteractiveTransitionAnimator.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/15.
//

#import "SMXSwipeInteractiveTransitionAnimator.h"

@implementation SMXSwipeInteractiveTransitionAnimator

- (void)startInteractiveTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    [super startInteractiveTransition:transitionContext];

}

- (instancetype) initWithRecognizer:(UIScreenEdgePanGestureRecognizer *)recognizer {
    self = [super init];
    if (self) {
        self.recognizer = recognizer;
        [self.recognizer addTarget:self action:@selector(recognizeUpdate:)];
    }
    return self;
}

- (CGFloat)percentageOfAnimator:(CGFloat)xPoint {
    
    CGFloat percentage = 0;
    UIViewController *fromVC = [self.transitionContext viewControllerForKey: UITransitionContextFromViewControllerKey];
    BOOL ispresenting = fromVC.presentedViewController.presentingViewController == fromVC;
    CGFloat width = UIScreen.mainScreen.bounds.size.width;
    
    if(ispresenting) {
        percentage = (width - xPoint) / width;
    } else {
        percentage =  xPoint / width;
    }
    return percentage;
}

- (void)recognizeUpdate:(UIScreenEdgePanGestureRecognizer *)recognizer{
    UIGestureRecognizerState state = recognizer.state;
    CGFloat xPoint = [recognizer locationInView:[self.transitionContext containerView]].x;
    switch (state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
              [self updateInteractiveTransition:[self percentageOfAnimator:xPoint]];
            NSLog(@"------------------1");
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:
            [self cancelInteractiveTransition];
            NSLog(@"------------------2");
            break;
        case UIGestureRecognizerStateEnded:
            if ([self percentageOfAnimator:xPoint] >= 0.5) {
                NSLog(@"------------------3");
                [self finishInteractiveTransition];
            } else {
                NSLog(@"------------------4");
                [self cancelInteractiveTransition];
            }
            break;
        default:
            [self cancelInteractiveTransition];
            break;
    }
}
@end
