//
//  FENewsVC.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FENewsVC.h"
#import "FENews.h"
#import "FENewsListRequest.h"
#import "FENewsListResponse.h"
#import "FEShopWebServiceManager.h"
#import "FENewsTableViewCell.h"
#import "FENewsDetailVC.h"

@interface FENewsVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet FETableView *newsTableView;
@property (strong, nonatomic) NSArray *newsList;

@end

@implementation FENewsVC

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UITabBarItem *tabitem = [[UITabBarItem alloc] initWithTitle:FEString(@"最新资讯") image:[UIImage imageNamed:@"tabbar_news_normal"] selectedImage:[UIImage imageNamed:@"tabbar_news_pressed"]];
        self.tabBarItem = tabitem;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self requestNews];
    self.title = FEString(@"最新咨询");
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}

-(void)requestNews{
    __weak typeof(self) weakself = self;
    FENewsListRequest *rdata = [[FENewsListRequest alloc] init];
    [[FEShopWebServiceManager sharedInstance] newsList:rdata response:^(NSError *error, FENewsListResponse *response) {
        if (!error && response.result.errorCode.integerValue == 0) {
            weakself.newsList = response.newsList;
            [weakself.newsTableView reloadData];
        }
    }];
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FENewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsItemCell" forIndexPath:indexPath];
    FENews *news = self.newsList[indexPath.row];
    cell.textLabel.text = news.title;
    cell.detailTextLabel.text = news.Date;
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.newsList.count;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[FENewsTableViewCell class]]) {
        FENewsDetailVC *vc = (FENewsDetailVC *)segue.destinationViewController;
        vc.news = self.newsList[[self.newsTableView indexPathForCell:sender].row];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
