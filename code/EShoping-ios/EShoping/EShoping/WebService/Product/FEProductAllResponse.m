//
//  FEProductAllResponse.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductAllResponse.h"
#import "FEProduct.h"

@implementation FEProductAllResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        _productList = [self getListFromObject:response[@"productList"] class:[FEProduct class]];
    }
    return self;
}

@end
