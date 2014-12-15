//
//  FEProductDeleteOrderRequest.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductDeleteOrderRequest.h"

@implementation FEProductDeleteOrderRequest

-(id)initWithUid:(NSInteger)userID productID:(NSInteger)pid quantity:(NSInteger)quan orderid:(NSString *)oid{
    self = [super initWithMothed:__METHOD_PRODUCT_DELETEORDER];
    if (self) {
        _userID = @(userID);
        _productID = @(pid);
        _quantity = @(quan);
        _orderID = oid;
    }
    return self;
}

@end
