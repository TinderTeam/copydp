//
//  FEProductGetSellerResponse.h
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"
#import "FEShopSeller.h"

@interface FEProductGetSellerResponse : FEBaseResponse
@property (nonatomic, strong, readonly) FEShopSeller *seller;
@end
