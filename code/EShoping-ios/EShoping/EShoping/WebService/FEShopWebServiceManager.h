//
//  FEShopWebServiceManager.h
//  EShoping
//
//  Created by Seven on 14-11-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

@class FEUserRegistRequest;
@class FEUserRegistResponse;
@class FEUserSigninRequest;
@class FEUserSigninResponse;

@interface FEShopWebServiceManager : AFHTTPRequestOperationManager

+(FEShopWebServiceManager *)sharedInstance;

//regist
-(AFHTTPRequestOperation *)registWithParam:(FEUserRegistRequest *)rdata response:(void (^)(NSError *error, FEUserRegistResponse *response))block;
//sign in
-(AFHTTPRequestOperation *)signinWithParam:(FEUserSigninRequest *)rdata response:(void (^)(NSError *error, FEUserSigninResponse *response))block;

@end
