//
//  FEShopSeller.h
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEShopSeller : FEObject

@property (nonatomic, strong, readonly) NSNumber *user_id;
@property (nonatomic, strong, readonly) NSString *seller_name;
@property (nonatomic, strong, readonly) NSString *qr_code;
@property (nonatomic, strong, readonly) NSString *city_id;
@property (nonatomic, strong, readonly) NSString *zone_id;
@property (nonatomic, strong, readonly) NSNumber *type_id;
@property (nonatomic, strong, readonly) NSString *dscr;
@property (nonatomic, strong, readonly) NSString *position;
@property (nonatomic, strong, readonly) NSString *img;
@property (nonatomic, strong, readonly) NSString *info;
@property (nonatomic, strong, readonly) NSString *status;
@property (nonatomic, strong, readonly) NSString *type_name;
@property (nonatomic, strong, readonly) NSNumber *father_id;
@property (nonatomic, strong, readonly) NSString *city;
@property (nonatomic, strong, readonly) NSString *zone_name;
@property (nonatomic, strong, readonly) NSString *password;
@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *role;


@end
