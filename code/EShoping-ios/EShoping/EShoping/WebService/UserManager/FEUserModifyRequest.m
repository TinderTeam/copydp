//
//  FEUserModifyRequest.m
//  EShoping
//
//  Created by Seven on 15-3-13.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEUserModifyRequest.h"

@implementation FEUserModifyRequest
-(id)initWithCustomer:(FECustomer *)customer{
    self = [super initWithMothed:__METHOD_USER_MODIFY];
    if (self) {
        _customer = customer.dictionary;
    }
    return self;
}
@end
