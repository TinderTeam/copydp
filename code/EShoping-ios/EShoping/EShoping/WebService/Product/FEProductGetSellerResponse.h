//
//  FEProductGetSellerResponse.h
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"
#import "FEShopSeller.h"
#import "FEProduct.h"
#import "FESellerEval.h"

@interface FEProductGetSellerResponse : FEBaseResponse
@property (nonatomic, strong, readonly) FEShopSeller *seller;
@property (nonatomic, strong, readonly) NSArray *productList;
@property (nonatomic, strong, readonly) NSArray *sellerEvalList;

@end
