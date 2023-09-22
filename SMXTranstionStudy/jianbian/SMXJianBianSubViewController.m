//
//  SMXJianBianSubViewController.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/2.
//

#import "SMXJianBianSubViewController.h"

@interface SMXJianBianSubViewController ()

@property (nonatomic, strong) UIButton *transitionButton;


@end

@implementation SMXJianBianSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width ,[UIScreen mainScreen].bounds.size.height/2);
//    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width ,[UIScreen mainScreen].bounds.size.height/2);
    self.transitionButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    self.transitionButton.backgroundColor = [UIColor greenColor];
    [self.transitionButton setTitle:@"点击转场" forState:UIControlStateNormal];
    [self.view addSubview:self.transitionButton];
    [self.transitionButton addTarget:self action:@selector(startTransform) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)startTransform{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
