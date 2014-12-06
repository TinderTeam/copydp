//
//  FEMessageVC.m
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEMessageVC.h"
#import "FESegmentControl.h"
#import "FETableView.h"
#import "FENewsListRequest.h"
#import "FENewsListResponse.h"
#import "FEShopWebServiceManager.h"


@interface FEMessageVC ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet FESegmentControl *messageTypeSeg;
@property (strong, nonatomic) IBOutlet FETableView *messageTableView;

@end

@implementation FEMessageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = FEString(@"全部广播");
    self.messageTypeSeg.sectionTitles = @[FEString(@"用户消息"),@"系统消息",@"广播"];
    self.messageTypeSeg.selectionStyle = HMSegmentedControlSelectionStyleArrow;
    self.messageTypeSeg.font = [UIFont appFontWithSize:14];
    self.messageTypeSeg.backgroundColor = FEThemeWhite;
    self.messageTypeSeg.selectedTextColor = FEThemeOrange;
    self.messageTypeSeg.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    
    [self requestNews];
}

-(void)requestNews{
    FENewsListRequest *rdata = [[FENewsListRequest alloc] init];
    [[FEShopWebServiceManager sharedInstance] newsList:rdata response:^(NSError *error, FENewsListResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            NSLog(@"news success!");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.tintColor = FEThemeOrange;
}

#pragma mark - UITableViewDateSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (self.messageTypeSeg.selectedSegmentIndex) {
        case 0:
            return [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
            
        default:
            return [tableView dequeueReusableCellWithIdentifier:@"messageCell" forIndexPath:indexPath];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
