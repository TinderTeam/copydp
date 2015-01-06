//
//  FEProductRecommendResponse.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductRecommendResponse.h"
#import "FEProduct.h"

@implementation FEProductRecommendResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        
        _productList = [self getListFromObject:response[@"productList"] class:[FEProduct class]];
//        NSArray *products = response[@"productList"];
//        if (products && ![products isKindOfClass:[NSNull class]]) {
//            NSMutableArray *productList = [NSMutableArray new];
//            for (id item in products) {
//                [productList addObject:[[FEProduct alloc] initWithDictionary:item]];
//            }
//            _productList = productList;
//        }
    }
    return self;
}

@end
