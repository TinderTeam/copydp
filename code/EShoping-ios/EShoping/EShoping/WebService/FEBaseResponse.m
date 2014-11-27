//
//  FEBaseResponse.m
//  EShoping
//
//  Created by Seven on 14-11-26.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"
#import "FEResult.h"

@implementation FEBaseResponse

-(id)initWithResponse:(id)response{
    self = [super init];
    if (self) {
        _result = [[FEResult alloc] initWithDictionary:response[@"result"]];
    }
    return self;
}

@end
