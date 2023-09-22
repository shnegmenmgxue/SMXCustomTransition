//
//  SMXPrestationFirstViewViewController.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/9/11.
//

#import "SMXPrestationFirstViewViewController.h"
#import "SMXPrestationSubViewViewController.h"
#import "SMXPresentationController.h"
@interface SMXPrestationFirstViewViewController ()
@property (nonatomic, strong) UIButton *transitionButton;
@property (nonatomic, strong) SMXPresentationController *p;

@end

@implementation SMXPrestationFirstViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    self.transitionButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.transitionButton.backgroundColor = [UIColor redColor];
    [self.transitionButton setTitle:@"点击转场" forState:UIControlStateNormal];
    [self.view addSubview:self.transitionButton];
    [self.transitionButton addTarget:self action:@selector(startTransform) forControlEvents:UIControlEventTouchUpInside];
}

- (void)startTransform {
    SMXPrestationSubViewViewController *sub = [SMXPrestationSubViewViewController new];
    self.p = [[SMXPresentationController alloc] initWithPresentedViewController:sub presentingViewController:self];
    sub.transitioningDelegate = self.p;
    sub.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:sub animated:YES completion:^{
        NSLog(@"fuck finish");
    }];
}


@end
