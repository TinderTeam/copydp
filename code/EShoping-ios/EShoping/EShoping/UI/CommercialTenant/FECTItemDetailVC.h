//
//  FECTItemDetailVC.h
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FECommonViewController.h"
@class FEShopSeller;

@interface FECTItemDetailVC : FECommonViewController

@property (nonatomic, strong) FEShopSeller *seller;
@property (nonatomic, strong) NSNumber *sellerID;

@end
