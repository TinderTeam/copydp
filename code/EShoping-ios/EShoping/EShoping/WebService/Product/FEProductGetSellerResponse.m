//
//  FEProductGetSellerResponse.m
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductGetSellerResponse.h"

@implementation FEProductGetSellerResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        _seller = [[FEShopSeller alloc] initWithDictionary:response[@"seller"]];
        _productList = [self getListFromObject:response[@"productList"] class:[FEProduct class]];
        _sellerEvalList = [self getListFromObject:response[@"sellerEvalList"] class:[FESellerEval class]];
        
    }
    return self;
}

@end
