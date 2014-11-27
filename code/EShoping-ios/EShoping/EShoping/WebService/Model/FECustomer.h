//
//  FECustomer.h
//  EShoping
//
//  Created by Seven on 14-11-27.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseModel.h"

@interface FECustomer : FEBaseModel

@property (nonatomic, strong, readonly) NSNumber *user_id;
@property (nonatomic, strong, readonly) NSString *grade;
@property (nonatomic, strong, readonly) NSNumber *score;
@property (nonatomic, strong, readonly) NSString *cellphone;
@property (nonatomic, strong, readonly) NSString *email;
@property (nonatomic, strong, readonly) NSString *car_id;//车牌号
@property (nonatomic, strong, readonly) NSNumber *recommender_id;
@property (nonatomic, strong, readonly) NSString *status;
@property (nonatomic, strong, readonly) NSString *request;//请求类型 激活/升级/解冻
@property (nonatomic, strong, readonly) NSNumber *login_date;

@end
