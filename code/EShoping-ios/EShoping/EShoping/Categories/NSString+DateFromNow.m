//
//  NSString+DateFromNow.m
//  EShoping
//
//  Created by Seven on 14-12-10.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "NSString+DateFromNow.h"

@implementation NSString (DateFromNow)

-(NSInteger)dateFromNow{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    long date = [[formatter dateFromString:self] timeIntervalSince1970];
    long datenow = [[NSDate date] timeIntervalSince1970];
    return (date - datenow) / (60 * 60 * 24);
    
}

@end
