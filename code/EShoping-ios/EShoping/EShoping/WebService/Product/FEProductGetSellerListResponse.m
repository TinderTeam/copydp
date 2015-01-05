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
        NSArray *sellers = response[@"sellerList"];
        if (sellers && ![sellers isKindOfClass:[NSNull class]]) {
            NSMutableArray *sellerList = [NSMutableArray new];
            for (id item in sellers) {
                [sellerList addObject:[[FEShopSeller alloc] initWithDictionary:item]];
            }
            _sellerList = sellerList;
        }
    }
    return self;
}

@end
