//
//  FEBaseRequest.h
//  EShoping
//
//  Created by Seven on 14-11-26.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import "FEObject.h"

#define __METHOD_SIGIN              @"Index/login_rest" //登陆
#define __METHOD_REGIST             @"Index/register_rest" //注册
#define __METHOD_MODIFY_PASSWORD    @"Index/modifyPswd_rest" //
#define __METHOD_SIGOUT             @"Index/logout_rest"
#define __METHOD_USER_UPGRADE       @"Index/upGrade_rest"

#define __METHOD_CITY               @"Index/city_rest"  

//product
#define __METHOD_PRODUCT_RECOMMENDPRODUCT   @"Buy/RecommendProduct_rest" //推荐列表
#define __METHOD_PRODUCT_NEWPRODUCT         @"Buy/NewProduct_rest"      //最新特惠
#define __METHOD_PRODUCT_TYPERECTPRIDUCT    @"Buy/TypeRecProduct_rest"
#define __METHOD_PRODUCT_ALLPRODUCT         @"Buy/AllProduct_rest"      //
#define __METHOD_PRODUCT_GETPRODUCTTYPE     @"Buy/GetProdutType_rest"   //
#define __METHOD_PRODUCT_PRODUCTORDER       @"Buy/ProductOrder_rest"    //
#define __METHOD_PRODUCT_GREATEORDER        @"Buy/CreateOrder_rest"     //
#define __METHOD_PRODUCT_CANCELORDER        @"Buy/CancelOrder_rest"     //
#define __METHOD_PRODUCT_DELETEORDER        @"Buy/DeleteOrder_rest"
#define __METHOD_PRODUCT_GETSELLER        @"Buy/GetSellerInfo_rest"   //获取商家信息
#define __METHOD_PRODUCT_GETSELLERLIST      @"Buy/GetSellerList_rest"   //获取商家列表

//news
#define __METHOD_NEWS_GETNEWS       @"News/getNewsList_rest"

//activity manager
#define __METHOD_ACTIVITY_GETACTIVITY  @"Activity/activity_rest"
#define __METHOD_ACTIVITY_ACTIVITYORDER @"Activity/activityOrder_rest"
#define __METHOD_ACTIVITY_CREATEORDER   @"Activity/createOrder_rest"
#define __METHOD_ACTIVITY_CANCELORDER   @"Activity/cancelOrder_rest"

//community
#define __METHOD_COMMUNITY_HOTRECOMMEND      @"Community/HotRecommend_rest"//APP获取热点推荐帖子列表
#define __METHOD_COMMUNITY_HOTTOPIC          @"Community/HotTopic_rest"//APP获取热门话题帖子列表
#define __METHOD_COMMUNITY_ALL              @"Community/AllCommunity_rest"//APP获取所有帖子列表
#define __METHOD_COMMUNITY_HOTUSER          @"Community/HotUser_rest"//APP获取会员热榜列表
#define __METHOD_COMMUNITY_CREATETOPIC      @"Community/CreateTopic_rest"//APP创建新帖子
#define __METHOD_COMMUNITY_CREATERELY       @"Community/CreateReply_rest"//APP回复帖子


@interface FEBaseRequest : FEObject

@property (nonatomic, strong, readonly) NSString *method;

-(instancetype)initWithMothed:(NSString *)mothed;


@end
