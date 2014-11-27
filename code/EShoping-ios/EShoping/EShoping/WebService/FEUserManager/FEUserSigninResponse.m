//
//  FEUserSigninResponse.m
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEUserSigninResponse.h"
#import "FECustomer.h"
#import "FEUser.h"

@implementation FEUserSigninResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        _customer = [[FECustomer alloc] initWithDictionary:response[@"customer"]];
        _user = [[FEUser alloc] initWithDictionary:response[@"user"]];
        _token = response[@"token"];
    }
    return self;
}

@end
