//
//  FENews.h
//  EShoping
//
//  Created by Seven on 14-12-5.
//  Copyright (c) 2014年 FUEGO. All rights reserved.
//

#import "FEObject.h"

@interface FENews : FEObject

@property (nonatomic, strong, readonly) NSNumber *news_id;
@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, strong, readonly) NSString *Date;
@property (nonatomic, strong, readonly) NSString *content;

@end
