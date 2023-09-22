//
//  SMXSwipeSubViewController.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/15.
//

#import "SMXSwipeSubViewController.h"
#import "SMXSwipeTransitionDelegate.h"

@interface SMXSwipeSubViewController ()

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *recognizer;
//@property (nonatomic, strong) id<UIViewControllerTransitioningDelegate>transitionDelegate;

@end


@implementation SMXSwipeSubViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.recognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(startTransform:)];
    self.recognizer.edges = UIRectEdgeLeft;
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addGestureRecognizer:self.recognizer];
//    self.transitionDelegate = [[SMXSwipeTransitionDelegate alloc] initWithRecognizer:self.recognizer];
}

- (void)startTransform:(UIScreenEdgePanGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        ((SMXSwipeTransitionDelegate *)self.transitioningDelegate).recognizer = self.recognizer;
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"fuck dismiss---");
        }];
    }
}

@end
