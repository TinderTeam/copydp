//
//  FEProductTypeResponse.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductTypeResponse.h"
#import "FEProductType.h"

@implementation FEProductTypeResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        _typeList = [self getListFromObject:response[@"typeList"] class:[FEProductType class]];
    }
    return self;
}

@end
