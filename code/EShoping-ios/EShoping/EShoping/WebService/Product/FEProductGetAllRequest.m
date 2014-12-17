//
//  FEProductGetAllRequest.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductGetAllRequest.h"

@implementation FEProductGetAllRequest

-(id)initWithCity:(NSString *)city type:(NSInteger)type keyword:(NSString *)key isSearch:(BOOL)search zoneId:(NSInteger)zid{
    self = [super initWithMothed:__METHOD_PRODUCT_ALLPRODUCT];
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
