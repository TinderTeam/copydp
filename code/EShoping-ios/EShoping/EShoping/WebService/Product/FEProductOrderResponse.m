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
        NSArray *orders = response[@"orderList"];
        if (orders && ![orders isKindOfClass:[NSNull class]]) {
            NSMutableArray *orderList = [NSMutableArray new];
            for (id item in orders) {
                [orderList addObject:[[FEProductOrder alloc] initWithDictionary:item]];
            }
            _orderList = orderList;
        }
    }
    return self;
}

@end
