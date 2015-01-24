//
//  FECTItemDetailVC.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FECTItemDetailVC.h"
#import "FECTInfoTableCell.h"
#import "FEShopWebServiceManager.h"
#import "FEProductGetSellerRequest.h"
#import "FEProductGetSellerResponse.h"
#import "FEShopSeller.h"
#import "FESellerProductItemCell.h"
#import "FESellerEvalCell.h"
#import "FEShopingItemVC.h"
#import "FEMapView.h"
#import <FTCoreText/FTCoreTextView.h>

@interface FECTItemDetailVC ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate,FTCoreTextViewDelegate>{
    CGFloat _webViewHeight;
}
@property (strong, nonatomic) IBOutlet FETableView *infoTableView;
@property (strong, nonatomic) IBOutlet FEMapView *mapView;
@property (strong, nonatomic) IBOutlet FTCoreTextView *infoTextView;

@property (nonatomic, strong) NSMutableArray *allInfo;
@property (strong, nonatomic) IBOutlet UIImageView *ShopImageView;
@property (strong, nonatomic) FTCoreTextView *tview;

@end

@implementation FECTItemDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FTCoreTextView *textV = [[FTCoreTextView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    [self.view addSubview:textV];
    textV.delegate = self;
    _tview = textV;
    _tview.hidden = YES;
    
    _webViewHeight = 20;
    self.allInfo = [NSMutableArray new];
    if (self.seller) {
        [self.allInfo addObject:@[self.seller]];
        [self.ShopImageView sd_setImageWithURL:[NSURL URLWithString:FEShopImageUrlSring(self.seller.img)]];
    }
    [self requestSellerDetail];
}

-(void)requestSellerDetail{
    __weak typeof(self) weakself = self;
    NSNumber *sid;
    if (self.seller) {
        sid = self.seller.user_id;
    }else{
        sid = self.sellerID;
    }
    FEProductGetSellerRequest *rdata = [[FEProductGetSellerRequest alloc] initWithSellerId:sid];
    [[FEShopWebServiceManager sharedInstance] productGetSeller:rdata response:^(NSError *error, FEProductGetSellerResponse *response) {
        
        if (!error && response.result.errorCode.integerValue == 0) {
            [weakself.allInfo removeAllObjects];
            [weakself.allInfo addObject:@[response.seller]];
            [weakself.allInfo addObject:@[response.seller]];
            [weakself.allInfo addObject:@[response.seller]];
            weakself.seller = response.seller;
            weakself.tview.text = weakself.seller.info;
            NSString *positon = response.seller.position;
            NSArray *pa = [positon componentsSeparatedByString:@","];
            if (pa.count == 2) {
                [weakself.mapView setPin:CLLocationCoordinate2DMake([pa[1] floatValue], [pa[0] floatValue])];
            }
            
            if (response.productList) {
                [weakself.allInfo addObject:response.productList];
            }
            if (response.sellerEvalList) {
                [weakself.allInfo addObject:response.sellerEvalList];
            }
            [weakself.infoTableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id item = self.allInfo[indexPath.section][indexPath.row];
    if ([item isKindOfClass:[FEShopSeller class]]) {
        
        if (indexPath.section == 0) {
            FECTInfoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ctItemInfoCell" forIndexPath:indexPath];
            [cell configWithSeller:self.seller];
            return cell;
        }else if(indexPath.section == 1){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"webViewCell" forIndexPath:indexPath];
            FTCoreTextView *tview = (FTCoreTextView *)[cell viewWithTag:1];
            tview.text = self.seller.info;
            tview.delegate = self;
            
            FTCoreTextStyle *defaultStyle = [[FTCoreTextStyle alloc] init];
            defaultStyle.name = FTCoreTextTagDefault;
            defaultStyle.textAlignment = FTCoreTextAlignementJustified;
            defaultStyle.font = [UIFont systemFontOfSize:14];
            
            FTCoreTextStyle *h1Style = [defaultStyle copy];
            h1Style.name = @"h1";
            h1Style.font = [UIFont boldSystemFontOfSize:14*2.0f];
            h1Style.textAlignment = FTCoreTextAlignementCenter;
            
            FTCoreTextStyle *h2Style = [h1Style copy];
            h2Style.name = @"h2";
            h2Style.font = [UIFont boldSystemFontOfSize:14*1.25];
            
            FTCoreTextStyle *pStyle = [defaultStyle copy];
            pStyle.name = @"p";
            
            [tview addStyles:@[defaultStyle, h1Style, h2Style, pStyle]];
//            UIWebView *mapView = (UIWebView *)[cell viewWithTag:1];
//            [mapView loadHTMLString:self.seller.info baseURL:nil];
            return cell;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mapCell" forIndexPath:indexPath];
            FEMapView *mapView = (FEMapView *)[cell viewWithTag:1];
            NSArray *pa = [self.seller.position componentsSeparatedByString:@","];
            if (pa.count == 2) {
                [mapView setPin:CLLocationCoordinate2DMake([pa[1] floatValue], [pa[0] floatValue])];
            }
            return cell;
        }
        
    }else if([item isKindOfClass:[FEProduct class]]){
        FESellerProductItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellerProductCell" forIndexPath:indexPath];
        [cell configWithProduct:item];
        return cell;
    }else if([item isKindOfClass:[FESellerEval class]]){
        FESellerEvalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellerEvalCell" forIndexPath:indexPath];
        cell.textLabel.text = ((FESellerEval *)item).eva_content;
        return cell;
    }
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id item = self.allInfo[indexPath.section][indexPath.row];
    if ([item isKindOfClass:[FEShopSeller class]]) {
        if (indexPath.section == 0) {
            FEShopSeller *seller = item;
            CGSize size = [seller.dscr boundingRectWithSize:CGSizeMake(self.view.bounds.size.width - 20, 99999) withTextFont:[UIFont appFontWithSize:14]];
            return (120 - 15 + size.height);
        }else if(indexPath.section == 1){
            return _webViewHeight;
        }
        return 150;
        
    }else if([item isKindOfClass:[FEProduct class]]){
        return 70;
    }else if([item isKindOfClass:[FESellerEval class]]){
        return 55;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allInfo.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allInfo[section] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    id item = [self.allInfo[section] firstObject];
    if ([item isKindOfClass:[FEShopSeller class]]) {
        if (section == 0) {
            return FEString(@"基本信息");
        }else if(section == 1){
            return FEString(@"商户介绍");
        }else{
            return FEString(@"商家位置");
        }
        
    }else if([item isKindOfClass:[FEProduct class]]){
        return FEString(@"商户产品");
    }else if([item isKindOfClass:[FESellerEval class]]){
        return FEString(@"商户评价");
    }
    return nil;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '300%'";
    [webView stringByEvaluatingJavaScriptFromString:str];
//    [webView sizeToFit];
//    _webViewHeight = webView.frame.size.height;
//    [self.infoTableView reloadData];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[FESellerProductItemCell class]]) {
        FEShopingItemVC *vc = segue.destinationViewController;
        vc.product = ((FESellerProductItemCell *)sender).product;
    }
}

- (void)coreTextViewfinishedRendering:(FTCoreTextView *)coreTextView{
    if (coreTextView.tag != 1) {
        NSAttributedString *astring = coreTextView.attributedString;
        NSString *string = astring.string;
        CGSize size = [string boundingRectWithSize:CGSizeMake(self.view.bounds.size.width, 99999) withTextFont:[UIFont systemFontOfSize:14]];
        //    CGSize textSize = [string boundingRectWithSize:CGSizeMake(self.view.bounds.size.width, 99999)
        //                                                   options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
        //                                                   context:nil].size;
        _webViewHeight = size.height + 10;
        [self.infoTableView reloadData];
    }
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
