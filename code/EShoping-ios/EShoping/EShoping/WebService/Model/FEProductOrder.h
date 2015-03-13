//
//  FEProductOrder.h
//  EShoping
//
//  Created by Seven on 14-11-29.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEProductOrder : FEObject

@property (nonatomic, strong, readonly) NSString *order_id;
@property (nonatomic, strong, readonly) NSString *order_name;
@property (nonatomic, strong, readonly) NSNumber *customer_id;
@property (nonatomic, strong, readonly) NSNumber *product_id;
@property (nonatomic, strong, readonly) NSString *product_name;
@property (nonatomic, strong, readonly) NSString *product_description;
@property (nonatomic, strong, readonly) NSNumber *seller_id;
@property (nonatomic, strong, readonly) NSString *order_time;
@property (nonatomic, strong, readonly) NSNumber *quantity;
@property (nonatomic, strong, readonly) NSNumber *order_price;
@property (nonatomic, strong, readonly) NSNumber *order_original_price;
@property (nonatomic, strong) NSString *order_status;
@property (nonatomic, strong, readonly) NSString *note;
@property (nonatomic, strong, readonly) NSString *imgsrc;
@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *end_date_time;
@property (nonatomic, strong, readonly) NSNumber *type_id;
@property (nonatomic, strong, readonly) NSString *type_name;
@property (nonatomic, strong, readonly) NSString *cellphone;
@property (nonatomic, strong, readonly) NSString *grade;

@end
