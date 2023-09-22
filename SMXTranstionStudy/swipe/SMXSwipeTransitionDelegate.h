//
//  SMXSwipeTransitionDelegate.h
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface SMXSwipeTransitionDelegate : NSObject <UIViewControllerTransitioningDelegate>
@property (nonatomic, weak) UIScreenEdgePanGestureRecognizer *recognizer;
- (instancetype) initWithRecognizer:(UIScreenEdgePanGestureRecognizer *)recognizer;
@end


