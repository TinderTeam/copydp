//
//  FEProductListRequest.h
//  EShoping
//
//  Created by Seven on 14-11-28.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseRequest.h"

@interface FEProductListRequest : FEBaseRequest

@property (nonatomic, strong, readonly) NSString *city;
@property (nonatomic, strong, readonly) NSNumber *typeRoot;
@property (nonatomic, strong, readonly) NSString *keyWord;
@property (nonatomic, strong, readonly) NSNumber *search;

-(id)initWithCity:(NSString *)city type:(NSInteger)type keyword:(NSString *)key isSearch:(BOOL)search;

@end
