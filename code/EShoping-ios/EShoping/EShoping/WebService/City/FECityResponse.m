//
//  FECityResponse.m
//  EShoping
//
//  Created by Seven on 14-12-8.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECityResponse.h"

@implementation FECityResponse

-(id)initWithResponse:(id)response{
    self = [super initWithResponse:response];
    if (self) {
        NSArray *citylist = response[@"cityList"];
        if (citylist && ![citylist isKindOfClass:[NSNull class]]) {
            _cityList = citylist;
        }
        NSArray *pinyin = response[@"pinyin"];
        if (pinyin && ![pinyin isKindOfClass:[NSNull class]]) {
            _pinyin = pinyin;
        }
    }
    return self;
}

@end
