//
//  FEProductGetSellerRequest.h
//  EShoping
//
//  Created by Seven on 14-12-12.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEProductGetSellerRequest : FEBaseRequest
@property (nonatomic, strong, readonly) NSNumber *seller_id;
-(id)initWithSellerId:(NSNumber *)sid;
@end
