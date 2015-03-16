//
//  FEUserModifyRequest.h
//  EShoping
//
//  Created by Seven on 15-3-13.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"
#import "FECustomer.h"

@interface FEUserModifyRequest : FEBaseRequest
@property (nonatomic, strong, readonly) NSDictionary *customer;
-(id)initWithCustomer:(FECustomer *)customer;
@end
