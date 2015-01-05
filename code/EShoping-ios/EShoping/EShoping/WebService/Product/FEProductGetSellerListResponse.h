//
//  FEProductGetSellerListResponse.h
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"
#import "FEShopSeller.h"

@interface FEProductGetSellerListResponse : FEBaseResponse
//private List<SellerJson> sellerList;
//private List<ProductJson> productList;
//private List<SellerEvalJson> sellerEvalList;

@property (nonatomic, strong, readonly) NSArray *sellerList;

@end
