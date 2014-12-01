//
//  FEActivityOrder.h
//  EShoping
//
//  Created by Seven on 14-11-30.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEActivityOrder : FEObject

@property (nonatomic, strong, readonly) NSString *activity_order_id;
@property (nonatomic, strong, readonly) NSNumber *activity_id;
@property (nonatomic, strong, readonly) NSNumber *customer_id;
@property (nonatomic, strong, readonly) NSString *activity_title;
@property (nonatomic, strong, readonly) NSString *activity_disc;
@property (nonatomic, strong, readonly) NSString *imgsrc;
@property (nonatomic, strong, readonly) NSNumber *memberlimit;
@property (nonatomic, strong, readonly) NSNumber *datetime;
@property (nonatomic, strong, readonly) NSNumber *datelimit;
@property (nonatomic, strong, readonly) NSString *status;
@property (nonatomic, strong, readonly) NSString *activity_status;
@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *grade;
@property (nonatomic, strong, readonly) NSString *cellphone;
@property (nonatomic, strong, readonly) NSString *email;

@end
