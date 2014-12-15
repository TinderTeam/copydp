//
//  FECity.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FECity.h"
#import "FEZone.h"

@implementation FECity

-(id)initWithDictionary:(id)dictionary{
    self = [super initWithDictionary:dictionary];
    if (self) {
        NSArray *zonelist = dictionary[@"zone_list"];
        if (zonelist && ![zonelist isKindOfClass:[NSNull class]]) {
            NSMutableArray *zones = [NSMutableArray new];
            for (NSDictionary *item in zonelist) {
                FEZone *zone = [[FEZone alloc] initWithDictionary:item];
                if (zone) {
                    [zones addObject:zone];
                }
            }
            _zone_list = zones;
        }
    }
    return self;
}

@end
