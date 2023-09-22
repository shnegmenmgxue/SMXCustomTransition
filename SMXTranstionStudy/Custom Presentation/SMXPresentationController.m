//
//  SMXPresentationController.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/9/11.
//

#import "SMXPresentationController.h"
#define CORNER_RADIUS   16.f
@interface SMXPresentationController()

@property (nonatomic, strong) UIView *dimmingView;
@property (nonatomic, strong) UIView *presentationRoundedCornerView;

@end

@implementation SMXPresentationController

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self ;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self ;
}



- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return self;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext { 
    UIView *toView  = [transitionContext viewForKey: UITransitionContextToViewKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey: UITransitionContextFromViewControllerKey];
    UIView *fromView  = [transitionContext viewForKey: UITransitionContextFromViewKey];
    CGRect toFrame = [transitionContext finalFrameForViewController:[transitionContext viewControllerForKey: UITransitionContextToViewControllerKey]];
    CGRect fromFrame = [transitionContext finalFrameForViewController:[transitionContext viewControllerForKey: UITransitionContextFromViewControllerKey]];
    UIView *containerView  = [transitionContext containerView];
    BOOL isPresenting = fromVC.presentedViewController.presentingViewController == fromVC;
    if (isPresenting) {
        [containerView addSubview:toView];
        toView.frame = CGRectOffset(toFrame, 0, toFrame.size.height);
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toView.frame = toFrame;
        } completion:^(BOOL finished) {
            if (finished && !transitionContext.transitionWasCancelled) {
                [transitionContext completeTransition:YES];
            } else {
                [transitionContext completeTransition:NO];
            }
        }];
    } else {
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//            fromView.frame = CGRectOffset(fromFrame, 0, fromFrame.size.height);
            fromView.frame = CGRectOffset(fromView.frame, 0, fromFrame.size.height);
        } completion:^(BOOL finished) {
            if (finished && !transitionContext.transitionWasCancelled) {
                [fromView removeFromSuperview];
                [transitionContext completeTransition:YES];
            } else {
                [transitionContext completeTransition:NO];
            }
         
        }];
    }
    
   
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext { 
    return 1;
}

- (UIView *)presentedView {
    return self.presentationRoundedCornerView;
}


- (void)presentationTransitionWillBegin {
    
    UIView *presentedView = [super presentedView];
    
    CGRect presentedViewSize = [self frameOfPresentedViewInContainerView];
    
    self.presentationRoundedCornerView = [[UIView alloc] initWithFrame:UIEdgeInsetsInsetRect(presentedViewSize, UIEdgeInsetsMake(0, 0, 0, 0))];
    self.presentationRoundedCornerView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.presentationRoundedCornerView.layer.cornerRadius = CORNER_RADIUS;
    self.presentationRoundedCornerView.layer.masksToBounds = YES;
    presentedView.frame = CGRectMake(0, 0, presentedViewSize.size.width, presentedViewSize.size.height);
    ;
    [self.presentationRoundedCornerView addSubview:presentedView];
    
    
    self.dimmingView = [[UIView alloc] initWithFrame:self.containerView.bounds];
    self.dimmingView.backgroundColor = [UIColor blackColor];
    self.dimmingView.alpha = 0;
    
//    self.dimmingView addt
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDimmingView:)];
    tap.numberOfTouchesRequired = 1;
    tap.numberOfTapsRequired = 1;
    [self.dimmingView addGestureRecognizer:tap];
    [self.containerView addSubview:self.dimmingView];
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentedViewController.transitionCoordinator;
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0.5;
        
        } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
    }];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
     if (completed == NO)
    {
        self.presentationRoundedCornerView = nil;
        self.dimmingView = nil;
    }
}

- (void)dismissalTransitionWillBegin{
    id <UIViewControllerTransitionCoordinator> transitionCoordinator= self.presentedViewController.transitionCoordinator;
    [transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0;
        }completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
            
        }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed{
    if (completed) {
        self.presentationRoundedCornerView = nil;
        self.dimmingView = nil;
    }
}

- (void)tapDimmingView:(UITapGestureRecognizer *)recognizer {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

//- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
//    <#code#>
//}
//

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
}
- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    
    [super preferredContentSizeDidChangeForChildContentContainer:container];
    self.dimmingView.frame = self.containerView.bounds;
    self.presentationRoundedCornerView.frame = self.frameOfPresentedViewInContainerView;
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGSize size = [self sizeForChildContentContainer:self.presentedViewController withParentContainerSize:self.containerView.frame.size];
    return CGRectMake(0, [UIScreen mainScreen].bounds.size.height - size.height, size.width, size.height);
}

- (CGSize)sizeForChildContentContainer:(id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize
{
    if (container == self.presentedViewController) {
        return self.presentedViewController.preferredContentSize;
    } else {
        return [super sizeForChildContentContainer:container withParentContainerSize:parentSize];
    }
}

- (void)containerViewWillLayoutSubviews
{
    [super containerViewWillLayoutSubviews];
    
    self.dimmingView.frame = self.containerView.bounds;
    self.presentationRoundedCornerView.frame = self.frameOfPresentedViewInContainerView;
}




@end
