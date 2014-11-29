//
//  FEProductOrderVC.h
//  EShoping
//
//  Created by Seven on 14-11-29.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECommonViewController.h"

@class FEProduct;

@interface FEProductOrderVC : FECommonViewController
@property (strong, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic, strong) FEProduct *product;

@end
