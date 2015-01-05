//
//  FEProductGetSellerListRequest.m
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEProductGetSellerListRequest.h"

@implementation FEProductGetSellerListRequest

-(id)initWithCity:(NSString *)city type:(NSInteger)type keyword:(NSString *)key isSearch:(BOOL)search zoneId:(NSInteger)zid{
    self = [super initWithMothed:__METHOD_PRODUCT_GETSELLERLIST];
    if (self) {
        _city = city;
        _typeRoot = @(type);
        _keyWord = key;
        _search = @(search);
        _zone_id = @(zid);
    }
    return self;
}

@end
