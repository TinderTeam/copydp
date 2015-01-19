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
#import "FEBaseResponse.h"

@class FEUserRegistRequest;
@class FEUserRegistResponse;
@class FEUserSigninRequest;
@class FEUserSigninResponse;
@class FEUserSignoutResquest;
@class FEUserSignoutResponse;
@class FEUserModifyPswRequest;
@class FEUserModifyPswResponse;
@class FEProductRecommendRequest;
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
@class FEActivityListRequest;
@class FEActivityListResponse;
@class FEActivityOrderCancelRequest;
@class FEActivityOrderCreateRequest;
@class FEActivityOrderCreateResponse;
@class FEActivityOrderListRequest;
@class FEActivityOrderListResponse;
@class FENewsListRequest;
@class FENewsListResponse;
@class FECommunityRecommendRequest;
@class FECommunityHotUserRequest;
@class FECommunityCreateTopicRequest;
@class FECommunityHotTopicRequest;
@class FECommunityReplyTopicRequest;
@class FECommunityAllRequest;
@class FECommunityCreateResponse;
@class FECommunityTopicResponse;
@class FECommunityListResponse;
@class FECityRequest;
@class FECityResponse;
@class FEProductGetSellerRequest;
@class FEProductGetSellerResponse;
@class FEProductGetSellerListRequest;
@class FEProductGetSellerListResponse;
@class FEUserGradeRequest;

@interface FEShopWebServiceManager : AFHTTPRequestOperationManager

+(FEShopWebServiceManager *)sharedInstance;

/*-------------------------------------------
 ;city service interface
 ;
 --------------------------------------------*/
//city
DEFINE_WEBSERVICE_METHOD_HEADER(city, FECityRequest, FECityResponse)

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
//up grade
DEFINE_WEBSERVICE_METHOD_HEADER(userUpGrade, FEUserGradeRequest, FEBaseResponse);

/*-------------------------------------------
 ;product service interface
 ;
 --------------------------------------------*/
//product recommed
DEFINE_WEBSERVICE_METHOD_HEADER(productRecommedProduct, FEProductRecommendRequest, FEProductRecommendResponse)
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

//product seller info
DEFINE_WEBSERVICE_METHOD_HEADER(productGetSeller, FEProductGetSellerRequest, FEProductGetSellerResponse)

//get sellet list
DEFINE_WEBSERVICE_METHOD_HEADER(productGetSellerList, FEProductGetSellerListRequest, FEProductGetSellerListResponse)

/*-------------------------------------------
 ;product news interface
 ;
 --------------------------------------------*/
//newslist
DEFINE_WEBSERVICE_METHOD_HEADER(newsList, FENewsListRequest, FENewsListResponse)

/*-------------------------------------------
 ;Activity service interface
 ;
 --------------------------------------------*/
//activity list
DEFINE_WEBSERVICE_METHOD_HEADER(activityList, FEActivityListRequest, FEActivityListResponse);
//activity order list
DEFINE_WEBSERVICE_METHOD_HEADER(activityOrderList, FEActivityOrderListRequest, FEActivityOrderListResponse);
//activity order create
DEFINE_WEBSERVICE_METHOD_HEADER(activityOrderCreate, FEActivityOrderCreateRequest, FEActivityOrderCreateResponse);
//activity order cancel
DEFINE_WEBSERVICE_METHOD_HEADER(activityOrderCancel, FEActivityOrderCancelRequest, FEActivityOrderCreateResponse);

/*-------------------------------------------
 ;Community service interface
 ;
 --------------------------------------------*/
//APP获取热点推荐帖子列表
DEFINE_WEBSERVICE_METHOD_HEADER(communityRecommend, FECommunityRecommendRequest, FECommunityListResponse)
//APP获取热门话题帖子列表
DEFINE_WEBSERVICE_METHOD_HEADER(communityHotTopic, FECommunityHotTopicRequest, FECommunityTopicResponse)
//APP获取所有帖子列表
DEFINE_WEBSERVICE_METHOD_HEADER(communityHotUser, FECommunityHotUserRequest, FECommunityListResponse)
//APP获取会员热榜列表
DEFINE_WEBSERVICE_METHOD_HEADER(communityAll, FECommunityAllRequest, FECommunityListResponse)
//APP创建新帖子
DEFINE_WEBSERVICE_METHOD_HEADER(communityCreateTopic, FECommunityCreateTopicRequest, FECommunityCreateResponse)
//APP回复帖子
DEFINE_WEBSERVICE_METHOD_HEADER(communityReplyTopic, FECommunityReplyTopicRequest, FECommunityCreateResponse)

@end
