//
//  SMXSwipeTransitionAnimator.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/15.
//

#import "SMXSwipeTransitionAnimator.h"

@implementation SMXSwipeTransitionAnimator

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *toView  = [transitionContext viewForKey: UITransitionContextToViewKey];
    UIView *fromView  = [transitionContext viewForKey: UITransitionContextFromViewKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey: UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey: UITransitionContextToViewControllerKey];
    
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    CGRect fromFrame = [transitionContext finalFrameForViewController:fromVC];
    CGRect fromInitialFrame = [transitionContext initialFrameForViewController:fromVC];
    
    UIView *containerView  = [transitionContext containerView];
    
    BOOL ispresenting = fromVC.presentedViewController.presentingViewController == fromVC;
    if(ispresenting) {
        toView.frame = CGRectOffset(fromFrame, fromFrame.size.width, 0);
        [containerView addSubview:toView];
    }
    
   
    [UIView animateWithDuration:[self transitionDuration:transitionContext]  animations:^{
        if(ispresenting) {
            toView.frame = toFrame;
        } else {
            fromView.frame = CGRectOffset(fromInitialFrame, fromInitialFrame.size.width, 0);
        }
    } completion:^(BOOL finished) {

        BOOL cancel = transitionContext.transitionWasCancelled;
        
        [transitionContext completeTransition:!cancel];
    }];
    

}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext { 
    return 3;
}

@end
