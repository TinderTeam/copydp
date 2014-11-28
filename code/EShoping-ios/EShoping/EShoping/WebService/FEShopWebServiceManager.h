//
//  FEShopWebServiceManager.h
//  EShoping
//
//  Created by Seven on 14-11-21.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#define DEFINE_WEBSERVICE_METHOD_HEADER(requestMethod,requestDataClass,classResponse) \
-(AFHTTPRequestOperation *)requestMethod:(requestDataClass *)rdata response:(void (^)(NSError *error, classResponse *response))block;

#define DEFINE_WEBSERVICE_METHOD_FOR_CLASS(requestMethod,requestDataClass,classResponse) \
\
-(AFHTTPRequestOperation *)requestMethod:(requestDataClass *)rdata response:(void (^)(NSError *error, classResponse *response))block{ \
return [self postmanager:rdata responseClass:[classResponse class] response:block];\
}

#import "AFHTTPRequestOperationManager.h"

@class FEUserRegistRequest;
@class FEUserRegistResponse;
@class FEUserSigninRequest;
@class FEUserSigninResponse;
@class FEUserSignoutResquest;
@class FEUserSignoutResponse;
@class FEUserModifyPswRequest;
@class FEUserModifyPswResponse;
@class FEProductListRequest;
@class FEProductNewRequest;
@class FEProductTypeRecRequest;
@class FEProductTypeRequest;
@class FEProductGetAllRequest;
@class FEProductOrderRequest;
@class FEProductCreateOrderRequest;
@class FEProductCancelOrderRequest;
@class FEProductDeleteOrderRequest;
@class FEProductRecommendResponse;
@class FEProductNewResponse;
@class FEProductTypeRecResponse;
@class FEProductTypeResponse;
@class FEProductAllResponse;
@class FEProductOrderResponse;
@class FEProductCreateOrderResponse;
@class FEProductOrderCancelResponse;
@class FEProductDeleteOrderResponse;

@interface FEShopWebServiceManager : AFHTTPRequestOperationManager

+(FEShopWebServiceManager *)sharedInstance;

/*-------------------------------------------
 ;user service interface
 ;
 --------------------------------------------*/
//regist
DEFINE_WEBSERVICE_METHOD_HEADER(regist, FEUserRegistRequest, FEUserRegistResponse)
//signin
DEFINE_WEBSERVICE_METHOD_HEADER(signin, FEUserSigninRequest, FEUserSigninResponse)
//modify password
DEFINE_WEBSERVICE_METHOD_HEADER(modifyPassword, FEUserModifyPswRequest, FEUserModifyPswResponse)
//sign out
DEFINE_WEBSERVICE_METHOD_HEADER(signout, FEUserSignoutResquest, FEUserSignoutResponse)

/*-------------------------------------------
 ;product service interface
 ;
 --------------------------------------------*/
//product recommed
DEFINE_WEBSERVICE_METHOD_HEADER(productRecommedProduct, FEProductListRequest, FEProductRecommendResponse)
//product new
DEFINE_WEBSERVICE_METHOD_HEADER(productNew, FEProductNewRequest, FEProductNewResponse);
//product recommed type
DEFINE_WEBSERVICE_METHOD_HEADER(productRecommedType, FEProductTypeRecRequest, FEProductTypeRecResponse)
//product type
DEFINE_WEBSERVICE_METHOD_HEADER(productType, FEProductTypeRequest, FEProductTypeResponse)
//get all product
DEFINE_WEBSERVICE_METHOD_HEADER(productAll, FEProductGetAllRequest, FEProductAllResponse)
//product order
DEFINE_WEBSERVICE_METHOD_HEADER(productOrder, FEProductOrderRequest, FEProductOrderResponse)
//product create order
DEFINE_WEBSERVICE_METHOD_HEADER(productOrderCreate, FEProductCreateOrderRequest, FEProductCreateOrderResponse)
//product order cancel
DEFINE_WEBSERVICE_METHOD_HEADER(productOrderCancel, FEProductCancelOrderRequest, FEProductOrderCancelResponse)
//product order delete
DEFINE_WEBSERVICE_METHOD_HEADER(productOrderDelete, FEProductDeleteOrderRequest, FEProductDeleteOrderResponse)

@end
