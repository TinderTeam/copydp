//
//  FEProduct.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FEProduct : FEObject


@property (nonatomic, strong, readonly) NSNumber *product_id;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSNumber *type_id;
@property (nonatomic, strong, readonly) NSNumber *seller_id;
@property (nonatomic, strong, readonly) NSString *update_date;
@property (nonatomic, strong, readonly) NSString *end_date_time;
@property (nonatomic, strong, readonly) NSString *price;
@property (nonatomic, strong, readonly) NSString *original_price;
@property (nonatomic, strong, readonly) NSString *dscr;
@property (nonatomic, strong, readonly) NSString *basic_infor;
@property (nonatomic, strong, readonly) NSString *svip_product_id;
@property (nonatomic, strong, readonly) NSString *imgsrc;
@property (nonatomic, strong, readonly) NSString *imglist;
@property (nonatomic, strong, readonly) NSString *product_status;
@property (nonatomic, strong, readonly) NSNumber *city_id;
@property (nonatomic, strong, readonly) NSString *city;
@property (nonatomic, strong, readonly) NSNumber *zone_id;
@property (nonatomic, strong, readonly) NSString *zone_name;
@property (nonatomic, strong, readonly) NSString *username;
@property (nonatomic, strong, readonly) NSString *current_member;

@end
