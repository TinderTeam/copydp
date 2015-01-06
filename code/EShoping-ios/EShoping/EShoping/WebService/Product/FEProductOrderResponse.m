//
//  FEProductOrderResponse.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductOrderResponse.h"
#import "FEProductOrder.h"

@implementation FEProductOrderResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        _orderList = [self getListFromObject:response[@"orderList"] class:[FEProductOrder class]];
    }
    return self;
}

@end
