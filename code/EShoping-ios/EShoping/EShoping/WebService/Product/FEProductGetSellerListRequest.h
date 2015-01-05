//
//  FEProductGetSellerListRequest.h
//  EShoping
//
//  Created by Seven on 15-1-5.
//  Copyright (c) 2015年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEProductGetSellerListRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSString *city;
@property (nonatomic, strong, readonly) NSNumber *typeRoot;
@property (nonatomic, strong, readonly) NSString *keyWord;
@property (nonatomic, strong, readonly) NSNumber *search;
@property (nonatomic, strong, readonly) NSNumber *zone_id;

-(id)initWithCity:(NSString *)city type:(NSInteger)type keyword:(NSString *)key isSearch:(BOOL)search zoneId:(NSInteger)zid;

@end
