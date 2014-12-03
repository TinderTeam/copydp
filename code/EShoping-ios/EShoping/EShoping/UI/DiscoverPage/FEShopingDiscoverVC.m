//
//  FEShopingDiscoverVC.m
//  EShoping
//
//  Created by Seven on 14-11-15.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEShopingDiscoverVC.h"
#import <ZBarSDK/ZBarSDK.h>


@interface FEShopingDiscoverVC ()<UISearchBarDelegate,ZBarReaderDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIBarButtonItem *QRBarItem;
@property (strong, nonatomic) IBOutlet UITableView *discoverTableView;

@end

@implementation FEShopingDiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
}

- (IBAction)codeQR:(id)sender {
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
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
    
    // EXAMPLE: do something useful with the barcode data
//    resultText.text = symbol.data;
    
    // EXAMPLE: do something useful with the barcode image
//    resultImage.image =
//    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissViewControllerAnimated:YES completion:nil];
}

-(void)initUI{
    
    self.navigationController.navigationBar.barTintColor = FEThemeWhite;
    self.navigationController.navigationBar.tintColor = FEThemeOrange;
    self.searchDisplayController.displaysSearchBarInNavigationBar = YES;
    self.navigationItem.rightBarButtonItem = self.QRBarItem;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UISearchDisplayControllerdelegate methods
- (void) searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {
    [controller setActive:YES animated:YES];
    self.navigationItem.rightBarButtonItem = nil;
//    controller.searchBar.transform = CGAffineTransformMakeTranslation(0, 0);
//    self.searchBar.transform = CGAffineTransformMakeTranslation(0, 0);
}
- (void) searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller  {
    [controller.searchResultsTableView setDelegate:self];
//    controller.searchResultsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void) searchDisplayControllerWillEndSearch:(UISearchDisplayController *)controller {
//    self.searchBar.transform = CGAffineTransformMakeTranslation(0, 0);
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BOOL)searchDisplayController:(UISearchDisplayController*)controller shouldReloadTableForSearchString:(NSString *)searchString {
    //    [self filterContentForSearchText:searchString];
    return YES;
}

-(void)searchDisplayController:(UISearchDisplayController *)controller willShowSearchResultsTableView:(UITableView *)tableView {
//    self.searchTable = tableView;
//    [tableView setContentInset:UIEdgeInsetsZero];
//    [tableView setScrollIndicatorInsets:UIEdgeInsetsZero];
}

- (void)searchDisplayControllerDidEndSearch:(UISearchDisplayController *)controller{
    self.navigationItem.rightBarButtonItem = self.QRBarItem;
//    [self.searchBar resignFirstResponder];
}

#pragma mark - UITableViewDelegate
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.discoverTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"discoverCell" forIndexPath:indexPath];
        return cell;
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        static NSString *identifier = @"cell";
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
    if (tableView == self.discoverTableView) {
        return 1;
    }else if (tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.discoverTableView) {
        return 1;
    }else if(tableView == self.searchDisplayController.searchResultsTableView){
        return 1;
    }
    return 0;
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
