//
//  SMXJianBianViewController.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/2.
//

#import "SMXJianBianViewController.h"
#import "SMXJianBianTransitionAnimator.h"
#import "SMXJianBianSubViewController.h"

@interface SMXJianBianViewController ()

@property (nonatomic, strong) id<UIViewControllerAnimatedTransitioning>transitionAnimator;
@property (nonatomic, strong) UIButton *transitionButton;

@end

@implementation SMXJianBianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.transitionButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.transitionButton.backgroundColor = [UIColor redColor];
    [self.transitionButton setTitle:@"点击转场" forState:UIControlStateNormal];
    [self.view addSubview:self.transitionButton];
    [self.transitionButton addTarget:self action:@selector(startTransform) forControlEvents:UIControlEventTouchUpInside];
    self.transitionAnimator = [[SMXJianBianTransitionAnimator alloc] init];
    // Do any additional setup after loading the view.
}
- (void)startTransform {
    SMXJianBianSubViewController *sub = [SMXJianBianSubViewController new];
    sub.transitioningDelegate = self;
    sub.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:sub animated:YES completion:^{
        NSLog(@"fuck finish");
    }];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.transitionAnimator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.transitionAnimator;
}

@end
