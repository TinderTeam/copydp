//
//  FEProductOrderResponse.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"

@interface FEProductOrderResponse : FEBaseResponse

@property (nonatomic, strong, readonly) NSArray *orderList;

@end
