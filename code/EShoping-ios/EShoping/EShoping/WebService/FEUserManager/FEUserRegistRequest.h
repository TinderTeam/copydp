//
//  FEUserRegistRequest.h
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"
@class FEUser;
@class FECustomer;

@interface FEUserRegistRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSDictionary *user;
@property (nonatomic, strong, readonly) NSDictionary *customer;
@property (nonatomic, strong, readonly) NSString *code;

-(id)initWithUser:(FEUser *)user customer:(FECustomer *)customer code:(NSString *)code;

@end
