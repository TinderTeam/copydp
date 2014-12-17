//
//  FEShopingHomeVC.m
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingHomeVC.h"
#import "FECitySelectVC.h"
#import "FEShopingFuncCell.h"
#import "FEShopingItemCell.h"
#import "FEShopWebServiceManager.h"
#import "FEProductAllResponse.h"
#import "FEProductGetAllRequest.h"
#import "FEProductRecommendResponse.h"
#import "FEProductRecommendRequest.h"
#import "FECommonNavgationController.h"
#import "FEShopingItemVC.h"
#import "FECitySelectVC.h"
#import "FEResult.h"
#import "FEProduct.h"
#import "FECityRequest.h"
#import "FECityResponse.h"
#import "FEProductTypeRequest.h"
#import "FEProductTypeResponse.h"
#import "CDCategory.h"
#import "CDCity.h"
#import "FEProductType.h"
#import "FESegmentControl.h"
#import "FEFuncCollectionViewCell.h"
#import "FEGroupCategoryVC.h"

#import "FEProductNewRequest.h"
#import "FEProductNewResponse.h"
#import "FEProductType.h"
#import "FEProductTypeRecRequest.h"
#import "FEProductTypeRecResponse.h"

#import "FECity.h"
#import "FEZone.h"
#import "CDZone.h"
#import "GAAlertObj.h"

#import <ZBarSDK/ZBarReaderViewController.h>

#define __CATEGORY_TYPE @"type"
#define __CATEGORY_SOURCE @"source"


@interface FEShopingHomeVC ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate,FECitySelectVCDelegate,ZBarReaderDelegate>{
    dispatch_semaphore_t semaphore;
    BOOL _productRecommendBecome;
}
@property (strong, nonatomic) IBOutlet UITableView *shopingTableView;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@property (nonatomic, strong) NSArray *productList;
@property (strong, nonatomic) NSArray *productNew;
@property (strong, nonatomic) NSArray *productTypeRecommed;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *regionBarItem;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *messageBarItem;
@property (strong, nonatomic) FESegmentControl *segment;

@end

@implementation FEShopingHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
    __weak typeof(self) weakself = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:FERegionCityDidChang object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        weakself.regionBarItem.title = FEUserDefaultsObjectForKey(FEShopRegionKey);
        [weakself requestRecommend];
    }];
    [self getcityandcategory];
}



-(void)initUI{
    [self.regionBarItem setTitle:FEUserDefaultsObjectForKey(FEShopRegionKey)];
    self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
    self.navigationItem.leftBarButtonItem = self.regionBarItem;
    self.navigationItem.rightBarButtonItem = self.messageBarItem;
}

- (IBAction)qrscan:(id)sender {
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.showsZBarControls = YES;
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentViewController:reader animated:YES completion:nil];
}

-(void)gotoLocation:(id)sender{
    FECitySelectVC *city = [FECitySelectVC new];
    [self presentViewController:city animated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NSLog(@"segue identifier %@",segue.identifier);
    if ([segue.identifier isEqualToString:@"categorySegue"]) {
        
    }else if([segue.identifier isEqualToString:@"showProductItem"]){
        FEShopingItemVC *productVC = (FEShopingItemVC *)segue.destinationViewController;
        productVC.product = ((FEShopingItemCell *)sender).product;
    }else if(sender == self.regionBarItem){
        FECitySelectVC *city = (FECitySelectVC *)((FECommonNavgationController *)segue.destinationViewController).topViewController;
        city.delegate = self;
    }else if([sender isKindOfClass:[FEFuncCollectionViewCell class]]){
        CDCategory *category = ((FEFuncCollectionViewCell *)sender).productCategory;
        FEGroupCategoryVC *vc = segue.destinationViewController;
        vc.productcategory = category;
    }else if([segue.identifier isEqualToString:@"searchProdcutSegue"]){
        FEGroupCategoryVC *vc = segue.destinationViewController;
        vc.isSearch = YES;
        vc.searchKey = ((UISearchBar *)sender).text;
        
    }
}

#pragma mark - RequestRecommend

-(void)requestRecommend{
    _productRecommendBecome = NO;
    __weak typeof(self) weakself = self;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        FEProductNewRequest *rdata = [[FEProductNewRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
        [[FEShopWebServiceManager sharedInstance] productNew:rdata response:^(NSError *error, FEProductNewResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                weakself.productNew = response.productList;
            }
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        FEProductTypeRecRequest *rdata = [[FEProductTypeRecRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
        [[FEShopWebServiceManager sharedInstance] productRecommedType:rdata response:^(NSError *error, FEProductTypeRecResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                NSArray *types = [response.productList valueForKey:@"type_id"];
                NSMutableArray *recommendType = [NSMutableArray array];
                NSArray *categorys = [FECoreData fetchCategory];
                for (NSNumber *type in types) {
                    NSArray *typeProduct = [response.productList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.type_id == %@",type]];
                    CDCategory *category = [categorys filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.type_id == %@",type]].lastObject;
                    [recommendType addObject:category];
                    [recommendType addObjectsFromArray:typeProduct];
//                    [recommendType addObject:@{__CATEGORY_TYPE:category,__CATEGORY_SOURCE:typeProduct}];
                }
                
                weakself.productTypeRecommed = recommendType; //response.productList;
            }
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        FEProductRecommendRequest *rdata = [[FEProductRecommendRequest alloc] initWithCity:FEUserDefaultsObjectForKey(FEShopRegionKey) type:0 keyword:nil isSearch:NO];
        [[FEShopWebServiceManager sharedInstance] productRecommedProduct:rdata response:^(NSError *error, FEProductRecommendResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                weakself.productList = response.productList;
            }
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        _productRecommendBecome = YES;
        [weakself.shopingTableView reloadData];
    });
}

#pragma mark - UITableViewDataSource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.shopingTableView) {
        if (indexPath.section == 0) {
            FEShopingFuncCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopingCategory" forIndexPath:indexPath];
            return cell;
        }else{
            if (self.segment.selectedSegmentIndex == 1) {
                if ([self.productTypeRecommed[indexPath.row] isKindOfClass:[CDCategory class]]) {
                    FEShopingItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cateGoryTitleCell" forIndexPath:indexPath];
                    cell.textLabel.text = ((CDCategory *)self.productTypeRecommed[indexPath.row]).type_name;
                    return cell;
                }
            }
            FEShopingItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopingItem" forIndexPath:indexPath];
            
            FEProduct *product;
            switch (self.segment.selectedSegmentIndex) {
                case 0:
                    product = self.productNew[indexPath.row];
                    break;
                case 1:
                    product = self.productTypeRecommed[indexPath.row];
                    break;
                case 2:
                    product = self.productList[indexPath.row];
                    break;
                default:
                    break;
            }
            [cell configWithProduct:product];
            return cell;
        }
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        static NSString *identifier = @"search";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        cell.textLabel.text = @"1";
        return cell;
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView == self.shopingTableView) {
        return _productRecommendBecome?2:1;
    }else{
        return 1;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.shopingTableView) {
        if (section == 0) {
            return 1;
        }else{
            switch (self.segment.selectedSegmentIndex) {
                case 0:
                    return self.productNew.count;
                case 1:
                    return self.productTypeRecommed.count;
                case 2:
                    return self.productList.count;
                default:
                    return 0;
            }
        }
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        return 0;
    }
    
    return 0;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        if (!self.segment) {
            _segment = [[FESegmentControl alloc] initWithSectionTitles:@[@"最新特惠",@"分类推荐",@"热门推荐"]];
            _segment.font = FEFont(14);//[UIFont systemFontOfSize:14];
            _segment.selectedTextColor = FEThemeOrange;
            _segment.selectionIndicatorColor = FEThemeOrange;
            _segment.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
            _segment.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
            _segment.selectionIndicatorHeight = 2;
            [_segment addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
        }
        return self.segment;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 44;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 190;
    }
    switch (self.segment.selectedSegmentIndex) {
        case 0:
            return 110;
        case 1:
            if ([self.productTypeRecommed[indexPath.row] isKindOfClass:[CDCategory class]]) {
                return 35;
            }
            return 110;
        case 2:
            return 110;
        default:
            return 0;
    }
//    return 110;
    
}

#pragma mark - SegmentControllClick
-(void)segmentedControlChangedValue:(FESegmentControl *)seg{
    [self.shopingTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationAutomatic];
}

//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    if (tableView == self.shopingTableView) {
//        return 20;
//    }
//    return 0;
//}

#pragma mark - UISearchDisplayControllerdelegate methods
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = nil;
    [controller.searchBar setShowsCancelButton:YES animated:YES];
}
- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller  {

}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {

}

-(BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString];
    return NO;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption{
    return YES;
}

-(void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView {
    
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
    self.navigationItem.rightBarButtonItem = self.messageBarItem;
    self.navigationItem.leftBarButtonItem = self.regionBarItem;
    [controller.searchBar setShowsCancelButton:NO animated:YES];
    //        [self.searchBar resignFirstResponder];
}

#pragma mark - UISearchBarDelegate
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self performSegueWithIdentifier:@"searchProdcutSegue" sender:searchBar];
    [self.searchDisplayController setActive:NO animated:NO];
//    searchBar.text = @"";
}

-(void)filterContentForSearchText:(NSString*)searchText {
    
}

#pragma mark - UIImagePickerViewDelegate
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:FEString(@"提示") message:symbol.data delegate:nil cancelButtonTitle:FEString(@"OK") otherButtonTitles: nil];
    [alert show];
//    GAAlertAction *act = [GAAlertAction actionWithTitle:FEString(@"OK") action:^{
//        [reader dismissViewControllerAnimated:YES completion:^{
//            
//        }];
//    }];
//    [GAAlertObj showAlertWithTitle:FEString(@"提示") message:symbol.data actions:@[act]];
    // EXAMPLE: do something useful with the barcode data
    //    resultText.text = symbol.data;
    
    // EXAMPLE: do something useful with the barcode image
    //    resultImage.image =
    //    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = FEThemeOrange;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//get all city list and product category list
-(void)getcityandcategory{
//    if ([FECoreData fetchCity].count && [FECoreData fetchCategory].count) {
//        [self requestRecommend];
//        return;
//    }
    [self displayHUD:FEString(@"加载中...")];
    __weak typeof(self) weakself = self;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        FECityRequest *rdata = [[FECityRequest alloc] init];
        [[FEShopWebServiceManager sharedInstance] city:rdata response:^(NSError *error, FECityResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                for (FECity *fecity in response.cityList) {
                    
                    NSString *region = FEUserDefaultsObjectForKey(FEShopRegionKey);
                    if (!region) {
                        FEUserDefaultsSetObjectForKey(fecity.city, FEShopRegionKey);
                        FEUserDefaultsSync;
                        [weakself.regionBarItem setTitle:fecity.city];
                    }
                    
                    CDCity *city = [FECoreData touchCityByName:fecity.city];
                    city.citynumber = fecity.city_id;
                    city.x = fecity.x;
                    city.y = fecity.y;
                    CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, (CFStringRef)fecity.city);
                    CFStringTransform(string, NULL, kCFStringTransformMandarinLatin,NO);
                    NSString *pinyin = (__bridge NSString *)string;
                    NSString *firtletter = NULL;
                    if (pinyin.length) {
                        firtletter = [pinyin substringToIndex:1];
                    }else{
                        firtletter = @"#";
                    }
                    firtletter = [firtletter uppercaseString];
                    city.citypinin = firtletter;
                    for (FEZone *zone in fecity.zone_list) {
                        CDZone *cdzone = [FECoreData touchZoneByID:zone.zone_id];
                        cdzone.zone_name = zone.zone_name;
                        cdzone.city_id = fecity.city_id;
                        [city addZone_listObject:cdzone];
                    }
                }
                
            }
            CDZone *czone = [FECoreData touchZoneByID:@(0)];
            czone.zone_name = @"全部商圈";
            czone.city = nil;
            [FECoreData saveCoreData];
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_async(group, queue, ^{
        FEProductTypeRequest *rdata = [[FEProductTypeRequest alloc] initWithTypeRoot:0];
        dispatch_semaphore_t sem = dispatch_semaphore_create(0);
        [[FEShopWebServiceManager sharedInstance] productType:rdata response:^(NSError *error, FEProductTypeResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                for (FEProductType *item in response.typeList) {
                    CDCategory *category = [FECoreData touchCategoryById:item.type_id];
                    category.type_name = item.type_name;
                    category.father_id = item.father_id;
                }
                CDCategory *category = [FECoreData touchCategoryById:@(0)];
                category.type_name = @"全部分类";
                category.father_id = @(-1);
                [FECoreData saveCoreData];
            }
            dispatch_semaphore_signal(sem);
        }];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [weakself hideHUD:YES];
        [weakself.shopingTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        [weakself requestRecommend];
    });
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
