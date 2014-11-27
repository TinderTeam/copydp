//
//  FEUserRegistRequest.m
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEUserRegistRequest.h"
#import "FEUser.h"
#import "FECustomer.h"

@implementation FEUserRegistRequest

-(id)initWithUser:(FEUser *)user customer:(FECustomer *)customer code:(NSString *)code{
    self = [super initWithMothed:__METHOD_REGIST];
    if (self) {
        _user = user.dictionary;
        _customer = customer.dictionary;
        _code = code;
    }
    return self;
}

@end
