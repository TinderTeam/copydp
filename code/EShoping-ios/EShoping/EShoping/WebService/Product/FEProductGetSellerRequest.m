//
//  FEProductGetSellerRequest.m
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductGetSellerRequest.h"

@implementation FEProductGetSellerRequest

-(id)initWithSellerId:(NSNumber *)sid{
    self = [super initWithMothed:__METHOD_PRODUCT_GETSELLER];
    if (self) {
        _seller_id = sid;
    }
    return self;
}

@end
