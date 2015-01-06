//
//  FESellerEval.h
//  EShoping
//
//  Created by Seven on 15-1-6.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FESellerEval : FEObject

@property (nonatomic, strong, readonly) NSNumber *seller_eva_id;
@property (nonatomic, strong, readonly) NSNumber *customer_id;
@property (nonatomic, strong, readonly) NSString *datetime;
@property (nonatomic, strong, readonly) NSNumber *score_environment;
@property (nonatomic, strong, readonly) NSNumber *score_service;
@property (nonatomic, strong, readonly) NSString *eva_content;
@property (nonatomic, strong, readonly) NSNumber *seller_id;
@property (nonatomic, strong, readonly) NSNumber *order_id;

@end
