//
//  FEActivityOrderListResponse.m
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityOrderListResponse.h"
#import "FEActivityOrder.h"

@implementation FEActivityOrderListResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        
        _orderList = [self getListFromObject:response[@"orderList"] class:[FEActivityOrder class]];
    }
    return self;
}

@end
