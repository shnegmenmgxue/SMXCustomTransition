//
//  ViewController.m
//  SMXTranstionStudy
//
//  Created by ByteDance on 2023/7/2.
//

#import "ViewController.h"
#import "SMXJianBianViewController.h"
#import "SMXSwipeViewController.h"
#import "SMXPrestationFirstViewViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) NSMutableString *teststring;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.tableview];
    self.tableview.backgroundColor = [UIColor whiteColor];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.teststring = @"string".mutableCopy;
    // Do any additional setup after loading the view.
}
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:self.view.frame];
    }
    return _tableview;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
       static NSString *CellTableIndentifier = @"CellTableIdentifier";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIndentifier];
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellTableIndentifier];
        }
        if(indexPath.row == 0) {
            cell.textLabel.text = @"系统转场";
        } else if (indexPath.row == 1 ) {
            cell.textLabel.text = @"轻扫转场";
        } else if (indexPath.row == 2 ) {
            cell.textLabel.text = @"UIPrestation";        }
        
        return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0) {
        SMXJianBianViewController *vc =  [[SMXJianBianViewController alloc] init];
        self.definesPresentationContext = YES;
        vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//        vc.modalTran sitionStyle = UIModalTransitionStylePartialCurl;
        [self presentViewController:vc animated:YES completion:^{}];
    } else if (indexPath.row == 1 ) {
        SMXSwipeViewController *vc =  [[SMXSwipeViewController alloc] init];
        self.definesPresentationContext = YES;
        vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//        vc.modalTran sitionStyle = UIModalTransitionStylePartialCurl;
        [self presentViewController:vc animated:YES completion:^{}];
        
    } else if (indexPath.row == 2 ) {
        SMXPrestationFirstViewViewController *vc = [[SMXPrestationFirstViewViewController alloc] init];
        self.definesPresentationContext = YES;
        vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        [self presentViewController:vc animated:YES completion:^{}];
    }
    
   
}



@end
