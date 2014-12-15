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
#import "FEActivityListRequest.h"
#import "FEActivityListResponse.h"
#import "FEActivityOrderCancelRequest.h"
#import "FEActivityOrderCreateRequest.h"
#import "FEActivityOrderCreateResponse.h"
#import "FEActivityOrderListRequest.h"
#import "FEActivityOrderListResponse.h"
#import "FENewsListResponse.h"
#import "FENewsListRequest.h"
#import "FECommunityRecommendRequest.h"
#import "FECommunityHotUserRequest.h"
#import "FECommunityCreateTopicRequest.h"
#import "FECommunityHotTopicRequest.h"
#import "FECommunityReplyTopicRequest.h"
#import "FECommunityAllRequest.h"
#import "FECommunityCreateResponse.h"
#import "FECommunityTopicResponse.h"
#import "FECommunityListResponse.h"
#import "FECityRequest.h"
#import "FECityResponse.h"
#import "FEProductGetSellerRequest.h"
#import "FEProductGetSellerResponse.h"

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

//city
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(city, FECityRequest, FECityResponse)

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
//product seller info
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(productGetSeller, FEProductGetSellerRequest, FEProductGetSellerResponse)

//news
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(newsList, FENewsListRequest, FENewsListResponse)

//activity method
//list
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(activityList, FEActivityListRequest, FEActivityListResponse);
//order list
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(activityOrderList, FEActivityOrderListRequest, FEActivityOrderListResponse);
//order
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(activityOrderCreate, FEActivityOrderCreateRequest, FEActivityOrderCreateResponse);
//order cancel
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(activityOrderCancel, FEActivityOrderCancelRequest, FEActivityOrderCreateResponse);

//community
//APP获取热点推荐帖子列表
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(communityRecommend, FECommunityRecommendRequest, FECommunityListResponse)
//APP获取热门话题帖子列表
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(communityHotTopic, FECommunityHotTopicRequest, FECommunityTopicResponse)
//APP获取所有帖子列表
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(communityHotUser, FECommunityHotUserRequest, FECommunityListResponse)
//APP获取会员热榜列表
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(communityAll, FECommunityAllRequest, FECommunityListResponse)
//APP创建新帖子
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(communityCreateTopic, FECommunityCreateTopicRequest, FECommunityCreateResponse)
//APP回复帖子
DEFINE_WEBSERVICE_METHOD_FOR_CLASS(communityReplyTopic, FECommunityReplyTopicRequest, FECommunityCreateResponse)


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
