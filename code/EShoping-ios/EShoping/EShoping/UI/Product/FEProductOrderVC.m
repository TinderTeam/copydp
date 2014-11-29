//
//  FEProductOrderVC.m
//  EShoping
//
//  Created by Seven on 14-11-29.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductOrderVC.h"
#import "FEShopWebServiceManager.h"
#import "FEProductCreateOrderRequest.h"
#import "FEProductCreateOrderResponse.h"
#import "AppDelegate.h"
#import "FECoreDataHandler.h"
#import "FEProduct.h"
#import "CDUser.h"


@implementation FEProductOrderVC

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.submitButton setBackgroundImage:[UIImage imageFromColor:FEThemeOrange] forState:UIControlStateNormal];
    self.submitButton.layer.cornerRadius = 4;
    self.submitButton.layer.masksToBounds = YES;
    
}

- (IBAction)submitOrder:(id)sender {
    if (FELoginUser) {
        FEProductCreateOrderRequest *rdata = [[FEProductCreateOrderRequest alloc] initWithUid:FELoginUser.user_id.integerValue productID:self.product.product_id.integerValue quantity:1 orderid:nil];
        [[FEShopWebServiceManager sharedInstance] productOrderCreate:rdata response:^(NSError *error, FEProductCreateOrderResponse *response) {
            if (!error && response.result.errorCode.integerValue == 0) {
                NSLog(@"order sucess!");
            }
        }];
    }else{
        [self performSegueWithIdentifier:@"productOrderToSignin" sender:sender];
    }
    
}

@end
