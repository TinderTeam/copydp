//
//  FEProductGetSellerListResponse.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEProductGetSellerListResponse.h"

@implementation FEProductGetSellerListResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        
        _sellerList = [self getListFromObject:response[@"sellerList"] class:[FEShopSeller class]];
    }
    return self;
}

@end
