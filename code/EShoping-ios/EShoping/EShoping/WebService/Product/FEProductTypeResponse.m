//
//  FEProductTypeResponse.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductTypeResponse.h"
#import "FEProductType.h"

@implementation FEProductTypeResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        NSArray *productTypes = response[@"typeList"];
        if (productTypes && ![productTypes isKindOfClass:[NSNull class]]) {
            NSMutableArray *productTypesList = [NSMutableArray new];
            for (id item in productTypes) {
                [productTypesList addObject:[[FEProductType alloc] initWithDictionary:item]];
            }
            _typeList = productTypesList;
        }
    }
    return self;
}

@end
