//
//  FECommunity.h
//  EShoping
//
//  Created by Seven on 14-12-6.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FECommunity : FEObject

@property (nonatomic, strong, readonly) NSNumber *community_id;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *community_type;
@property (nonatomic, strong, readonly) NSString *context;
@property (nonatomic, strong, readonly) NSString *datetime;
@property (nonatomic, strong, readonly) NSNumber *customer_id;
@property (nonatomic, strong, readonly) NSNumber *customer_number;
@property (nonatomic, strong, readonly) NSString *username;

@end
