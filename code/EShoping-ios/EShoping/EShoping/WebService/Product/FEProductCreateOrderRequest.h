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

-(id)initWithUid:(NSInteger)userID productID:(NSInteger)pid quantity:(NSInteger)quan orderid:(NSString *)oid;

@end
