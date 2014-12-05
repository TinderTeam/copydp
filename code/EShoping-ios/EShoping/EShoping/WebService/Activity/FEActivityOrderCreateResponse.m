//
//  FEActivityOrderCreateResponse.m
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityOrderCreateResponse.h"
#import "FEActivityOrder.h"

@implementation FEActivityOrderCreateResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        _activityOrder = [[FEActivityOrder alloc] initWithDictionary:response[@"activityOrder"]];
    }
    return self;
}

@end
