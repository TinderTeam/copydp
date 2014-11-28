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

#define __METHOD_CITY               @"Index/city_rest"  

//product
#define __METHOD_PRODUCT_RECOMMENDPRODUCT   @"Buy/RecommendProduct_rest"
#define __METHOD_PRODUCT_NEWPRODUCT         @"Buy/NewProduct_rest"
#define __METHOD_PRODUCT_TYPERECTPRIDUCT    @"Buy/TypeRecProduct_rest"
#define __METHOD_PRODUCT_ALLPRODUCT         @"Buy/AllProduct_rest"
#define __METHOD_PRODUCT_GETPRODUCTTYPE     @"Buy/GetProdutType_rest"
#define __METHOD_PRODUCT_PRODUCTORDER       @"Buy/ProductOrder_rest"
#define __METHOD_PRODUCT_GREATEORDER        @"Buy/CreateOrder_rest"
#define __METHOD_PRODUCT_CANCELORDER        @"Buy/CancelOrder_rest"
#define __METHOD_PRODUCT_DELETEORDER        @"Buy/DeleteOrder_rest"

//order
#define __METHOD_ORDER_PRODUCT      @"order/product/list"
#define __METHOD_ORDER_PRODUCT_CREATE   @"order/product/create"
#define __METHOD_ORDER_CANCEL       @"order/product/cancel"
#define __METHOD_ORDER_ABOLISH      @"order/product/abolish"
#define __METHOD_ORDER_DELETE       @"order/product/delete"

//news
#define __METHOD_NEWS_GETNEWS       @"News/getNewsList_rest"

//activity manager
#define __METHOD_ACTIVITY_GETACTIVITY  @"Activity/activity_rest"
#define __METHOD_ACTIVITY_ACTIVITYORDER @"Activity/activityOrder_rest"
#define __METHOD_ACTIVITY_CREATEORDER   @"Activity/createOrder_rest"
#define __METHOD_ACTIVITY_CANCELORDER   @"Activity/cancelOrder_rest"


@interface FEBaseRequest : FEObject

@property (nonatomic, strong, readonly) NSString *method;

-(instancetype)initWithMothed:(NSString *)mothed;


@end
