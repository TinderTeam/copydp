//
//  FEProductListRequest.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductRecommendRequest.h"

@implementation FEProductRecommendRequest

-(id)initWithCity:(NSString *)city type:(NSInteger)type keyword:(NSString *)key isSearch:(BOOL)search{
    self = [super initWithMothed:__METHOD_PRODUCT_RECOMMENDPRODUCT];
    if (self) {
        _city = city;
        _typeRoot = @(type);
        _keyWord = key;
        _search = @(search);
    }
    return self;
}

@end
