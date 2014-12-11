//
//  FECityResponse.m
//  EShoping
//
//  Created by Seven on 14-12-8.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECityResponse.h"
#import "FECity.h"

@implementation FECityResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        NSArray *citylist = response[@"cityList"];
        if (citylist && ![citylist isKindOfClass:[NSNull class]]) {
//            _cityList = citylist;
            NSMutableArray *citys = [NSMutableArray new];
            for (NSDictionary *city in citylist) {
                [citys addObject:[[FECity alloc] initWithDictionary:city]];
            }
            _cityList = citys;
        }
        NSArray *pinyin = response[@"pinyin"];
        if (pinyin && ![pinyin isKindOfClass:[NSNull class]]) {
            _pinyin = pinyin;
        }
    }
    return self;
}

@end
