//
//  SMXSwipeInteractiveTransitionAnimator.h
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SMXSwipeInteractiveTransitionAnimator : UIPercentDrivenInteractiveTransition

@property (nonatomic, weak) UIScreenEdgePanGestureRecognizer *recognizer;
@property (nonatomic, weak)  id<UIViewControllerContextTransitioning> transitionContext;

- (instancetype) initWithRecognizer:(UIScreenEdgePanGestureRecognizer *)recognizer;

@end


