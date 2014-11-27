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

#define __METHOD_MARK_LIST          @"user/mark/list"
#define __METHOD_MARK_ADD           @"user/mark/add"
#define __METHOD_MARK_DELET         @"user/mark/delet"



#define __METHOD_GET_NEWS           @"news/list"  //news
#define __METHOD_SEVICE_ORDER       @"order/list" //orders
#define __METHOD_SEVICE_ORDER_SET   @"order/set" //set order

#define __METHOD_HISTORY_ALARM      @"sensor/alarm"
#define __METHOD_SENSOR_LIST        @"sensor/list"
#define __METHOD_SENSOR_SET         @"sensor/set"
#define __METHOD_SENSOR_ENABLE      @"sensor/batch/enable"
#define __METHOD_SENSOR_DISABLE     @"sensor/batch/disable"

@interface FEBaseRequest : FEObject

@property (nonatomic, strong, readonly) NSString *method;

-(instancetype)initWithMothed:(NSString *)mothed;


@end
