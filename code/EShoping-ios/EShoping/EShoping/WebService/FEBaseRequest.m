//
//  FEBaseRequest.m
//  EShoping
//
//  Created by Seven on 14-11-26.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@implementation FEBaseRequest

-(instancetype)initWithMothed:(NSString *)mothed{
    self = [super init];
    if (self) {
        _method = mothed;
    }
    return self;
}


@end
