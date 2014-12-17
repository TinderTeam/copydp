//
//  FEGroupCategoryVC.h
//  EShoping
//
//  Created by Seven on 14-11-18.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECommonViewController.h"

@interface FEGroupCategoryVC : FECommonViewController

@property (nonatomic, strong) CDCategory *productcategory;
@property (nonatomic, assign) BOOL isSearch;
@property (nonatomic, strong) NSString *searchKey;

@end
