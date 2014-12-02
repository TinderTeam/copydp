//
//  FEShopWebServiceManager.m
//  EShoping
//
//  Created by Seven on 14-11-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#define __SERVICE_BASE_URL [NSString stringWithFormat:@"%@/copydp/index.php",__WEB_SERVICE_IP]


#import "FEShopWebServiceManager.h"
#import "FEUserRegistRequest.h"
#import "FEUserRegistResponse.h"
#import "FEUserSigninRequest.h"
#import "FEUserSigninResponse.h"
#import "FEResult.h"
#import "FEUserSignoutResponse.h"
#import "FEUserSignoutResquest.h"
#import "FEUserModifyPswRequest.h"
#import "FEUserModifyPswResponse.h"
#import "FEProductRecommendRequest.h"
#import "FEProductNewRequest.h"
#import "FEProductTypeRecRequest.h"
#import "FEProductTypeRequest.h"
#import "FEProductGetAllRequest.h"
#import "FEProductOrderRequest.h"
#import "FEProductCreateOrderRequest.h"
#import "FEProductCancelOrderRequest.h"
#import "FEProductDeleteOrderRequest.h"
#import "FEProductRecommendResponse.h"
#import "FEProductNewResponse.h"
#import "FEProductTypeRecResponse.h"
#import "FEProductTypeResponse.h"
#import "FEProductAllResponse.h"
#import "FEProductOrderResponse.h"
#import "FEProductCreateOrderResponse.h"
#import "FEProductOrderCancelResponse.h"
#import "FEProductDeleteOrderResponse.h"

@implementation FEShopWebServiceManager

+(FEShopWebServiceManager *)sharedInstance{
    static FEShopWebServiceManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FEShopWebServiceManager alloc] initWithBaseURL:[NSURL URLWithString:__SERVICE_BASE_URL]];
    });
    return instance;
}

-(instancetype)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

//resgist
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(regist, FEUserRegistRequest, FEUserRegistResponse)
//sign in
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(signin, FEUserSigninRequest, FEUserSigninResponse)
//sign out
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(signout, FEUserSignoutResquest, FEUserSignoutResponse)
//modify password
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(modifyPassword, FEUserModifyPswRequest, FEUserModifyPswResponse)


//product recommed
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productRecommedProduct, FEProductRecommendRequest, FEProductRecommendResponse)
//product new
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productNew, FEProductNewRequest, FEProductNewResponse);
//product recommed type
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productRecommedType, FEProductTypeRecRequest, FEProductTypeRecResponse)
//product type
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productType, FEProductTypeRequest, FEProductTypeResponse)
//get all product
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productAll, FEProductGetAllRequest, FEProductAllResponse)
//product order
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productOrder, FEProductOrderRequest, FEProductOrderResponse)
//product create order
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productOrderCreate, FEProductCreateOrderRequest, FEProductCreateOrderResponse)
//product order cancel
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productOrderCancel, FEProductCancelOrderRequest, FEProductOrderCancelResponse)
//product order delete
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productOrderDelete, FEProductDeleteOrderRequest, FEProductDeleteOrderResponse)



-(AFHTTPRequestOperation *)postmanager:(FEBaseRequest *)data responseClass:(Class)class response:(void (^)(NSError *error,  id response))block {
    return [self POST:data.method parameters:data.dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id response = [[class alloc] initWithResponse:responseObject];
        block(NULL,response);
        [self showerrorResponse:response];
        NSLog(@"success!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error,NULL);
        [self showerror:error];
    }];
}

-(void)showerror:(NSError *)error{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"EShoping" message:[NSString stringWithFormat:@"%@",error.localizedDescription] delegate:nil cancelButtonTitle:FEString(@"OK") otherButtonTitles:nil];
    [alert show];
}

-(void)showerrorResponse:(FEBaseResponse *)response{
    if (response.result.errorCode.integerValue != 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:[NSString stringWithFormat:@"error code %@",response.result.errorCode] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

@end
