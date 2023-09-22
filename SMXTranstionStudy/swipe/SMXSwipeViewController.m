//
//  SMXSwipeViewController.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/15.
//

#import "SMXSwipeViewController.h"
#import "SMXSwipeSubViewController.h"
#import "SMXSwipeTransitionDelegate.h"

@interface SMXSwipeViewController ()

@property (nonatomic, strong) UIScreenEdgePanGestureRecognizer *recognizer;
@property (nonatomic, strong) id<UIViewControllerTransitioningDelegate>transitionDelegate;
@end

@implementation SMXSwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.recognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(startTransform:)];
    self.recognizer.edges = UIRectEdgeRight;
    [self.view addGestureRecognizer:self.recognizer];
    self.view.backgroundColor = [UIColor yellowColor];
    self.transitionDelegate = [[SMXSwipeTransitionDelegate alloc] initWithRecognizer:self.recognizer];
}


- (void)startTransform:(UIScreenEdgePanGestureRecognizer *)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        SMXSwipeSubViewController *subVC =  [[SMXSwipeSubViewController alloc] init];
        subVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
        subVC.transitioningDelegate =  self.transitionDelegate;
        [self presentViewController:subVC animated:YES completion:^{
            NSLog(@"fuck finish");
        }];
    }
    
}


@end
