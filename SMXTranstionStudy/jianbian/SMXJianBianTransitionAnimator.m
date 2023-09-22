//
//  SMXJianBianTransitionAnimator.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/15.
//

#import "SMXJianBianTransitionAnimator.h"

@implementation SMXJianBianTransitionAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *toView  = [transitionContext viewForKey: UITransitionContextToViewKey];
    UIView *fromView  = [transitionContext viewForKey: UITransitionContextFromViewKey];
    CGRect toFrame = [transitionContext finalFrameForViewController:[transitionContext viewControllerForKey: UITransitionContextToViewControllerKey]];
//    toView.frame = CGRectMake(0, 0, 200, 200);
    UIView *containerView  = [transitionContext containerView];
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    toView.alpha = 0;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromView.alpha = 0;
        toView.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:finished];
    }];
    
}

- (void)animationEnded:(BOOL)transitionCompleted {
    if (transitionCompleted) {
        NSLog(@"fuck");
    }
}

- (id<UIViewImplicitlyAnimating>)interruptibleAnimatorForTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    return nil;
}


@end
