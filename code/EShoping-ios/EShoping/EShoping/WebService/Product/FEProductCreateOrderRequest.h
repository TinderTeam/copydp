//
//  FEProductCreateOrderRequest.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEProductCreateOrderRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSNumber *userID;
@property (nonatomic, strong, readonly) NSNumber *productID;
@property (nonatomic, strong, readonly) NSNumber *quantity;
@property (nonatomic, strong, readonly) NSString *orderID;
@property (nonatomic, strong, readonly) NSNumber *seller_id;//扫码下单需要填写改字段
@property (nonatomic, strong, readonly) NSString *order_type;//订单类型，APP下单时使用，分为“普通下单”和“扫码下单”


-(id)initWithUid:(NSInteger)userID productID:(NSInteger)pid quantity:(NSInteger)quan sellerID:(NSNumber *)sid orderType:(NSString *)oType;

@end
