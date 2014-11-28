//
//  FEProductOrderRequest.m
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEProductOrderRequest.h"

@implementation FEProductOrderRequest

-(id)initWithUid:(NSInteger)userid{
    self = [super initWithMothed:__METHOD_PRODUCT_PRODUCTORDER];
    if (self) {
        _userID = @(userid);
    }
    return self;
}

@end
