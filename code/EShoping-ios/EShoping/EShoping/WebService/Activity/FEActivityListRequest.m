//
//  FEActivityListRequest.m
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEActivityListRequest.h"

@implementation FEActivityListRequest

-(id)initWithCity:(NSString *)city{
    self = [super initWithMothed:__METHOD_ACTIVITY_GETACTIVITY];
    if (self) {
        _city = city;
    }
    return self;
}

@end
