//
//  SMXPrestationFSubViewViewController.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/9/11.
//

#import "SMXPrestationSubViewViewController.h"

@interface SMXPrestationSubViewViewController ()
@property (nonatomic, strong) UIButton *transitionButtonHigh;
@property (nonatomic, strong) UIButton *transitionButtonLow;

@end

@implementation SMXPrestationSubViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2);
    self.view.backgroundColor = [UIColor redColor];
    self.transitionButtonHigh = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    self.transitionButtonHigh.backgroundColor = [UIColor redColor];
    [self.transitionButtonHigh setTitle:@"增高5cm" forState:UIControlStateNormal];
    [self.view addSubview:self.transitionButtonHigh];
    [self.transitionButtonHigh addTarget:self action:@selector(startTransform) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (void)startTransform {
    
    CGFloat height = self.preferredContentSize.height;
    height = MAX(height, [UIScreen mainScreen].bounds.size.height/2);
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, height + 10);
    
}


- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2);
}




@end
