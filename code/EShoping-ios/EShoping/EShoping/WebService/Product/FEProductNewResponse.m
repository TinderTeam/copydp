//
//  FEProductNewResponse.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductNewResponse.h"
#import "FEProduct.h"

@implementation FEProductNewResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        NSArray *products = response[@"productList"];
        if (products && ![products isKindOfClass:[NSNull class]]) {
            NSMutableArray *productList = [NSMutableArray new];
            for (id item in products) {
                [productList addObject:[[FEProduct alloc] initWithDictionary:item]];
            }
            _productList = productList;
        }
    }
    return self;
}

@end
