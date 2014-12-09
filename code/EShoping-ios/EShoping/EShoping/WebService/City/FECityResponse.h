//
//  FECityResponse.h
//  EShoping
//
//  Created by Seven on 14-12-8.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEBaseResponse.h"

@interface FECityResponse : FEBaseResponse
@property (nonatomic, strong, readonly) NSArray *cityList;
@property (nonatomic, strong, readonly) NSArray *pinyin;
@end
