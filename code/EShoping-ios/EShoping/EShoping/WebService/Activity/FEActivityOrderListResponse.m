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
        NSArray *activityOrderLists = response[@"orderList"];
        if (activityOrderLists && ![activityOrderLists isKindOfClass:[NSNull class]]) {
            NSMutableArray *orderList = [NSMutableArray new];
            for (id item in activityOrderLists) {
                [orderList addObject:[[FEActivityOrder alloc] initWithDictionary:item]];
            }
            _orderList = orderList;
        }
    }
    return self;
}

@end
