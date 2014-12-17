//
//  FEProductCreateOrderResponse.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductCreateOrderResponse.h"
#import "FEProductOrder.h"

@implementation FEProductCreateOrderResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        _productOrder = [[FEProductOrder alloc] initWithDictionary:response[@"productOrder"]];
    }
    return self;
}

@end
