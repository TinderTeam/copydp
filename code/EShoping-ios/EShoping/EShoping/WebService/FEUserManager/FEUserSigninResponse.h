//
//  FEUserSigninResponse.h
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"
@class FEResult;
@class FECustomer;
@class FEUser;

@interface FEUserSigninResponse : FEBaseResponse

@property (nonatomic, strong, readonly) FEUser *user;
@property (nonatomic, strong, readonly) FECustomer *customer;
@property (nonatomic, strong, readonly) NSString *token;


@end
